require_relative 'config.rb'
require 'jenkins_api_client'
require 'highline/import'

config = YAML.load_file('config.yml')



jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

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
