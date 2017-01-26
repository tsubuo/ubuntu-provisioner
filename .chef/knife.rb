local_mode true

cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

whitelist = %w[
  knife_zero
  os
  os_version
  ipaddress
  roles
  recipes
  ipaddress
]

knife[:ssh_attribute] = "knife_zero.host"
knife[:berkshelf_path] = "cookbooks"
knife[:default_attribute_whitelist] = []
knife[:normal_attribute_whitelist] = []
knife[:automatic_attribute_whitelist] = whitelist
knife[:override_attribute_whitelist] = []
