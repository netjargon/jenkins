require 'aws-sdk-ec2'
require 'json'

# ID that will be used to create the AMI i-020c1c36c6f828143

$ec2 = Aws::EC2::Resource.new(region: 'us-east-1')
$ec2Client = Aws::EC2::Client.new(region: 'us-east-1')

file = File.read('launch_instance.json')

data_hash = JSON.parse(file)

    
params = {}
    $ec2.instances.each do |id|
        if id.key_name.include?("pwhite")
            params[:instance_id] = id.instance_id
            params[:name] = id.key_name
            params[:dry_run] = "true"
        else 
            puts "This is not the correct hash key and values, please continue"
        end
    end

    begin
        
        puts "#{params.fetch(:name)}" + " " + "Will be used as the AMI name"
        $ec2Client.create_image(params)

    rescue Exception

        puts "Failed to create the image: #{$!}"

    end


