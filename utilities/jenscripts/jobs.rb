require 'jenkins_api_client'
require 'highline/import'
require 'encryptor'
require 'openssl'
require 'base64'

config = YAML.load_file('config.yml')



jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

puts "Here are a list of jobs that are currently available"
puts job.list_all

puts "Enter the name of the job you want to run"
jobName = gets.chomp

puts "running the build job #{jobName}"
job.build(jobName)

