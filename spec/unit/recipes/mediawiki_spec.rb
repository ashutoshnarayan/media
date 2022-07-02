require ‘chefspec’ 
describe ‘media::mediawiki’ do
 let(:chef_run) { 
 ChefSpec::Runner.new.converge(described_recipe) 
 }
 let (:chef_run) { ChefSpec::ChefRunner.new.converge 'media::mediawiki' }
     it 'extract mediawiki tar ball' do
      expect(chef_run).to create_directory('/var/www/mediawiki')
    end
    it 'create links' do
      expect(chef_run).to create_link('/var/www/mediawiki-1.31.1 mediawiki')
     end
 end
