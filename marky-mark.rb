#!/usr/bin/env ruby
require 'pry'
require 'csv'
require_relative 'graph'
require_relative 'node'
require_relative 'edge'

def cast_hash
  # movie id => array of actor ids
  hash = Hash.new {|h,k| h[k] = Array.new }
  CSV.foreach('cast_members.csv') do |row|
    hash[row[1]] << row[0]
  end
  hash
end

def connect_actors(actors, movie_id, movie_name, graph)
  #uses round robin scheduling to connect actors
  if !(actors.length % 2 == 0)
    actors << nil
  end
  n = actors.length
  rounds = n - 1
  games = n / 2
  shift = actors.shift
  for r in 0...rounds
    for g in 0...games
      actor1 = actors[g]
      actor2 = actors[-g]
      if g == 0
        actor1 = shift
      end
      if actor1 != nil && actor2 != nil
        a1 = graph.nodes[actor1]
        a2 = graph.nodes[actor2]
        graph.add_edge(Edge.new(a1, a2, movie_id, movie_name))
      end
    end
    actors.rotate!
  end
end

def make_graph
  cast = cast_hash
  g = Graph.new
  #each actor is a node in graph
  CSV.foreach('actors.csv') do |row|
    g.add_node(Node.new(row[0], row[1]))
  end

  CSV.foreach('movies.csv') do |row|
    connect_actors(cast[row[0]], row[0], row[1], g)
  end
  g
end

if ARGV.length != 1
  puts "usage: #{__FILE__} \"<actor name>\""
  exit(1)
end

target_actor = ARGV[0]

graph = make_graph



def closest_actor(hash)
  hash.min_by { |id, actor| actor.distance }[1]
end

def dijkstra(graph, start, target)
  unvisited = graph
  t = target

  unless unvisited.empty?
    # s = unvisited[start.id]
    s = closest_actor(unvisited)
    puts s.id
    s.neighbors.each do |i, n|
      puts "s1: =#{s.id}"
      if s.distance + 1 < n.distance
        n.distance = s.distance + 1
        n.previous = s.data
        puts "got here: #{s.id}"
      end
      if n.id == t.id
        puts "and here"
        until n.previous.nil?
          puts n.previous.data
          n = n.previous
        end
        exit(1)
      else
        puts "blah: #{s.id}"
        n.neighbors.delete(s.id)
        puts "deleting #{s.id}"
        unvisited.delete(s.id)
        # puts "includes? #{unvisited.has_key?(s.id)}"
        dijkstra(unvisited, n, t)
      end
    end
  end
end

# Mark Wahlberg
mrkymrk = graph.nodes['1841']
mrkymrk.distance = 0
target = graph.find_actor_by_name(target_actor)

graph.nodes.each do |id, actor|
  if id != actor.id
    puts "something went wrong."
    exit(1)
  end
end

dijkstra(graph.nodes, mrkymrk, target)
