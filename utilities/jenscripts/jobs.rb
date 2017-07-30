#require_relative 'setup/config.rb'
require 'jenkins_api_client'
require 'highline/import'
require 'optparse'



config = YAML.load_file('setup/config.yml')



jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

options = {}
option_parser = OptionParser.new do |opts|

    #Create a switch
    opts.on("-c", "--configure") do
        options[:configure] = true
    end

    #Create a flag
    opts.on("-u USER") do |user|
        options[:user] = user
    end 

    opts.on("-p PASSWORD") do |password|
        options[:password] = password
    end 

end

option_parser.parse!
puts options.inspect


puts "What would you like to do?"
puts "Your choices are: run and delete"

choice = gets.chomp

case choice

when "delete"
    puts job.list_all
    puts "Select a job to delete"
    jobName = gets.chomp
    job.delete(jobName)

when "run"
    puts job.list_all
    puts "What job would you like to run?"
    jobName = gets.chomp
    job.build(jobName)
else
    puts "no selection was made"
end
