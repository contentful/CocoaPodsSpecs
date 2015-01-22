#!/usr/bin/env ruby

require 'cocoapods-core'

puts "Homepages of contained Pods:\n\n"
puts Dir.glob('**/*.podspec').map { |spec| Pod::Specification.from_file(spec).homepage }.uniq
