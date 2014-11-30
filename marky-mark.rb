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

#test statements
g = Graph.new
n = Node.new(0, 'zero')
nn = Node.new(1, 'one')
e = Edge.new(n, nn, 2, 'two')
nnn = Node.new(3, 'three')
ee = Edge.new(n, nnn, 4, 'four')
n.print_info
