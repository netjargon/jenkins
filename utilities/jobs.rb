require 'jenkins_api_client'
require 'highline/import'
require 'encryptor'
require 'openssl'
require 'base64'

config = YAML.load_file('config.yml')

def get_password(prompt="Enter Password")
    ask(prompt) {|q| q.echo = false}
end

# a password but more preferable and secure, an API token can be used to authenticate to the Jenkins
# server.

puts "Do you need to configure jobs.rb?"
answer = gets.chomp
case answer

when "yes"
    puts "Please enter a server ip"
    server_ip = gets.chomp

    puts "Please, enter a server port"
    server_port = gets.chomp

    puts "Please enter your username"
    username = gets.chomp

    puts "Please, enter your password or API Token which will be added to a plaintext config file"
    password = get_password()



    config['username'] = username
    config['password'] = password
    config['server_ip'] = server_ip
    config['server_port'] = server_port


    File.open('config.yml', 'w') {
        |f| f.write config.to_yaml
    }

when "no"
    puts "#{answer} is the answer and we will continue"
end

jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

puts "Here are a list of jobs that are currently available"
puts job.list_all

puts "Enter the name of the job you want to run"
jobName = gets.chomp

puts "testing build job #{jobName}"
job.build(jobName)

