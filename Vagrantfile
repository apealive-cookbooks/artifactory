# -*- mode: ruby -*-
# vi: set ft=ruby :

DEFAULT_RUN_LIST = ["recipe[artifactory::default]"]
NODE_JSON = {}

# Inject networking configuration if you need something special.
# The key names match the recipe names in this cookbook.
NETWORKING = {
#  "dash" => {
#    :forward => {
#      "4567" => "4567"
#    }
#  },
#  "server" => {
#    :ip => "33.33.33.20",
#    :forward => {
#      "5555" => "5555"
#    }
#  }
}


Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true

  config.vm.box = "ubuntu-base"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"


  ## This vagrant is meant to be used from the root directory of the cookbook
  if File.exists?(File.expand_path("./metadata.rb"))

    # grabs the name of the current cookbook from the metadata file.
    COOKBOOK = IO.readlines("metadata.rb").select { |line| line =~ /^name/ }.first.split(" ")[1].tr('"','')

    # grabs the list of recipes in this cookbook
    RECIPES = Dir.entries("recipes").select {|f| !File.directory? f}.map { |f| f.gsub(/\.rb/,"") }

    RECIPES.each do |recipe|
      hostname = "vagrant.#{COOKBOOK}.#{recipe}"

      config.vm.define recipe.to_sym do |vm_config|

        vm_config.vm.provision :chef_solo do |chef|
          chef.run_list = DEFAULT_RUN_LIST.clone << "recipe[#{COOKBOOK}::#{recipe}]"
          chef.json = NODE_JSON
          chef.node_name = hostname
        end

        vm_config.vm.hostname = hostname
        vm_config.vm.network :private_network, ip: ip_override(recipe) if has_ip_override?(recipe)

        port_forwards(recipe).each do |port1, port2|
          vm_config.vm.network :forwarded_port, guest: port1.to_i, host: port2.to_i
        end
      end
    end
  else
    puts "WARNING: this Vagrantfile is meant to be run in the root directory of the cookbook\n\n"
  end
end

## helper methods
def has_ip_override?(recipe)
  if NETWORKING.has_key?(recipe)
     NETWORKING[recipe].has_key?(:ip)
  else
    false
  end
end

def ip_override(recipe)
  NETWORKING[recipe][:ip]
end

def port_forwards(recipe)
  return {} if !NETWORKING.has_key?(recipe)
  return {} if !NETWORKING[recipe].has_key?(:forward)
  NETWORKING[recipe][:forward]
end
