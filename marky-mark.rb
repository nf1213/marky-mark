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

def movie_hash
  hash = {}
  CSV.foreach('movies.csv') do |row|
    hash[row[0]] = row[1]
  end
  hash
end

def make_graph
  movies = movie_hash
  g = Graph.new
  #each actor is a node in graph
  CSV.foreach('actors.csv') do |row|
    g.add_node(Node.new(row[0], row[1]))
  end
  CSV.foreach('cast_members.csv') do |row|

  end
  g
end

graph = make_graph
graph.print_info
