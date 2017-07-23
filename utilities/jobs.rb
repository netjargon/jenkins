require 'jenkins_api_client'
require 'highline/import'
require 'encryptor'
require 'openssl'

config = YAML.load_file('config.yml')

def get_password(prompt="Enter Password")
    ask(prompt) {|q| q.echo = false}
end

password = get_password()
# Need to get if Jenkins is able to receive an encrypted string of a user password

# cipher = OpenSSL::Cipher.new('aes-256-gcm')
# cipher.encrypt
# secret_key = cipher.random_key
# iv = cipher.random_iv
# salt = SecureRandom.random_bytes(16)
# encrypted_value = Encryptor.encrypt(value: password, key: secret_key, iv: iv, salt: salt)
# decrypted_value = Encryptor.decrypt(value: encrypted_value, key: secret_key, iv: iv, salt: salt)

config['password'] = password

File.open('config.yml', 'w') {
    |f| f.write config.to_yaml
}

puts "Please enter your username"
#userName = gets.chomp


jenkins = JenkinsApi::Client.new(config)

job = JenkinsApi::Client::Job.new(jenkins)

# #while 

    puts "Here are a list of jobs that are currently available"
    puts job.list_all

    puts "Enter the name of the job you want to run"
    jobName = gets.chomp

    puts "testing build job #{jobName}"
    job.build(jobName)
# #end
