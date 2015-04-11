#!/usr/bin/env ruby
#
# Author: Robert Jorgenson
# Author email: rjorgenson@gmail.com
require 'Date'
ABBR_DAYNAMES = {0, 'Su', 1, 'Mo', 2, 'Tu', 3, 'We', 4, 'Th', 5, 'Fr', 6, 'Sa'}

def days_in_month(year, month)
  return (Date.new(year, 12, 31) &lt;&lt; (12 - month)).day
end

def day_in_month(year, month, day)
  return Date.new(year, month, day).wday
end

def build_day_array(year, month)
  day_array = Array.new
  for d in (1..days_in_month(year, month))
    day_array[d] = ABBR_DAYNAMES[day_in_month(year, month, d)]
  end
  day_array.shift
  return day_array * "   "
end

def build_separator(year, month)
  color = "\e[31m" #red
  #color = "\e[31m" #uncomment for red
  separator_string = "==" # change this to change separator, best if 2 characters wide
  close = "\e[0m" # don't change this
  separator = Array.new
  for d in (1..days_in_month(year, month))
    if year == Time.now.year &amp;&amp; month == Time.now.month &amp;&amp; d == Time.now.day then
      separator[d] = "#{color}#{separator_string}#{close}"
    else
      separator[d] = "#{separator_string}"
    end
  end
  separator.shift
  return separator * "   "
end

def build_date_array(year, month)
  date_array = Array.new
  for d in (1..days_in_month(year, month))
    date_array[d] = d
  end
  date_array.shift
  date_array.each do |d|
    if d &lt; 10 then
      date_array[(d-1)] = "0#{d}"
    end
  end
  return date_array * "   "
end

year = Time.now.year
month = Time.now.month

puts build_day_array(year, month)
puts build_separator(year, month)
puts build_date_array(year, month)
