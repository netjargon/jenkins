require_relative 'config.rb'
require 'jenkins_api_client'
require 'highline/import'

config = YAML.load_file('config.yml')



jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

puts "enter your password to test access to other files in program"
password = get_password()

def delete_jobs
    job.delete(jobName)
end

puts "Here are a list of jobs that are currently available"
puts job.list_all



puts "Enter the name of the job you want to run"
jobName = gets.chomp

puts "running the build job #{jobName}"
job.build(jobName)

