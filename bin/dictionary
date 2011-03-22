#!/usr/bin/env ruby

require 'rubygems' 
require 'open-uri'
require 'uri'
require 'nokogiri'

class Dictionary
  
  def self.run(argv)
    argv.empty? || argv.length == 1 ? show_help_message : new(argv)
  end
  
  def initialize(argv)
    language = argv.shift
    url = "http://www.google.com/dictionary?langpair=#{language}|#{language}&q=#{argv.join(' ')}"
    output = print_out(parse_dictionary(url))
    output.empty? ? puts("No dictionary definitions were found for: #{green_color(argv.join(' '))} in #{green_color(language)}") : puts(output)
  end
  
private
  
  def parse_dictionary(url)
    results = {:text => [], :link => []}
    doc = Nokogiri::HTML(open(URI.escape(url)))
    doc.css('ul.gls ul>li').each { |node| results[:text] << node.text }
    doc.css('ul.gls div>a').each { |node| results[:link] << node.attributes["href"].value }
    results
  end
  
  def print_out(results)
    output = ""
    results[:text].each_index do |x|
      output += "\n" if x == 0
      output += red_color((x + 1).to_s) + ' ' + results[:text][x].gsub(/^\n+/i, '') + "\n\n"
      output += "  #{green_color('Source')} " + trim(results[:link][x]) + "\n\n"
    end
    output
  end
  
  def trim(url)
    bitly_url = "http://bit.ly/?s=&keyword=&url=" + url
    doc = Nokogiri::HTML(open(URI.escape(bitly_url)))
    doc.css('span#short_url').each do |node|
      url = node.text
    end
    url 
  end
  
  def self.show_help_message
    puts <<HELP

This script queries google dictionary.

EXAMPLES:
    dictionary de bidirektional

USAGE:
    dictionary LANGUAGE WORD

    LANGUAGE:  Language code for the dictionary
    WORD:      Which word to look for in dictionary

HELP
  end
  
  def green_color(text)
    "\033[32m#{text}\033[0m"
  end
  
  def red_color(text)
    "\033[31m#{text}\033[0m"
  end
  
end

Dictionary.run(ARGV)