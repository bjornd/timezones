# encoding: UTF-8

require 'csv'
require 'json'
require 'digest'
require 'net/http'

timezones = {}
CSV.foreach('tz.csv', col_sep: ",", encoding: "ISO-8859-1") do |row|
  offset = row[2].sub('_', '-')
  timezones[offset] ||= []
  timezones[offset] << row[0]
end

File.open("tz-group.json", "w") do |file|
  file.write( timezones.to_json );
end
