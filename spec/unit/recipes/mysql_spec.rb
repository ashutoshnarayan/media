require ‘chefspec’ 
describe ‘media::mysql’ do
 let(:chef_run) { 
 ChefSpec::Runner.new.converge(described_recipe) 
 }
 context ‘when run on Debian’ do
 let(:chef_run) do
 runner = ChefSpec::ChefRunner.new( ‘platform’ => ‘debian’)
 runner.node.set[‘mysql’][‘install_path’] = ‘/usr/local’ 
 runner.node.set[‘mysql’][‘service_user’] = ‘mysql’ 
 runner.converge(‘mysql::server’) 
 end 
it ‘should include the correct Linux server recipe’ do 
 chef_run.should include_recipe ‘mysql::server_linux’ 
 end 
it ‘should create an INI file in the right directory’ do 
 ini_file = “/usr/local/mysql/mysql.ini”
 expect(chef_run).to create_template ini_file
 end 
it ‘should install the Debian MySQL package’ do 
 expect(chef_run).to install_package(‘mysql-server’) 
 end
end
