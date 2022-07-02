require ‘chefspec’ 
describe ‘media::php_setup’ do
 let(:chef_run) { 
 ChefSpec::Runner.new.converge(described_recipe) 
 }
let (:chef_run) { ChefSpec::ChefRunner.new.converge 'media::php_setup' }
  it 'install php' do
    expect(chef_run).to install_package(php)
  end
end
