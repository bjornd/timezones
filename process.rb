# encoding: UTF-8

require 'csv'
require 'json'
require 'digest'
require 'net/http'

timezones = {}
CSV.foreach('tz.csv', col_sep: ",", encoding: "ISO-8859-1") do |row|
  timezones[row[2]] ||= []
  timezones[row[2]] << row[0]
end

timezones.each_key do |k|
  puts k
end

File.open("tz-group.json", "w") do |file|
  file.write( timezones.to_json );
end
