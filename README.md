# Deployment of wiki page

Chef WorkStation : Local PC
Chef-Node : Virtual Machine running on PC
Chef Server - Hosted Chef : https://api.chef.io/

Execute the following command on Chef Workstation

1. Bootstrap the chef node by runing the following command :

knife bootstrap chef_node.domain.com -x <user_name> -i ~/.ssh/id_rsa -N node_one --sudo

2. Upload the cookbook to Hosted Chef Server :

knife cookbook upload media

knife cookbook list

3. Add recipes to run_list in order to execute on Chef Node :

knife node run_list add node_one "recipe[media::apache]"
knife node run_list add node_one "recipe[media::mysql]"
knife node run_list add node_one "recipe[media::php_setup]"
knife node run_list add node_one "recipe[media::mediawiki]"

knife node list

4. Finally run the below command to execute chef-client on Node

knife ssh 'name:node_one' 'sudo chef-client' -x root

