#!/usr/bin/ruby
require 'rest-client'
require 'json'
require 'yaml'

secrets = YAML.load_file('../secrets.yml')

url = "https://compute.api.cloud.yandex.net/compute/v1/instances?folderId=#{secrets['folder_id']}"
response = RestClient.get(url, {
  Authorization: "Bearer #{secrets['iam_token']}"
})

instances = JSON.parse(response.body)

hosts_name = {}
hosts_ip = []

instances['instances'].each do |i|
  hosts_name = { name: i['name'] }
  hosts_ip << i['networkInterfaces'][0]['primaryV4Address']['oneToOneNat']['address']
end

inventory = {
 _meta: {
  hostvars: {}
},
 yc: {
  hosts: hosts_ip,
  vars: hosts_name
  }
}

puts inventory.to_json if ARGV[0] == "--list"
