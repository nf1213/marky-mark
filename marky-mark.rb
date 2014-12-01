#!/usr/bin/env ruby
require 'pry'
require 'csv'
require_relative 'graph'
require_relative 'node'
require_relative 'edge'

if ARGV.length != 1
  puts "usage: #{__FILE__} \"<actor name>\""
  exit(1)
end

target_actor = ARGV[0]

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

graph = make_graph
graph.print_info
