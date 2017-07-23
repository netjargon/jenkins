require 'aws-sdk'

mykey = ENV["AWS_ACCESS_KEY_ID"]
mysecret = ENV["AWS_SECRET_ACCESS_KEY"]
myregion = ENV["AWS_REGION"]

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

ec2.instances.each do |instance|
    puts "ID: #{instance.id}"
    puts "State: #{instance.state.name}"
end
