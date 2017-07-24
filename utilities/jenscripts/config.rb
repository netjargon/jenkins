require 'jenkins_api_client'
require 'highline/import'

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
else
    puts "The answer is #{answer} but does not match the other options, we will not update config.yml"
end