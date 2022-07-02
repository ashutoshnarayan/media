require ‘chefspec’ 
describe ‘media::apache’ do
 let(:chef_run) { 
 ChefSpec::Runner.new.converge(described_recipe) 
 }
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'disables and stops httpd service' do
      expect(chef_run).to disable_service('httpd')
      expect(chef_run).to stop_service('httpd')
    end

    it 'removes the httpd package' do
      expect(chef_run).to remove_package('httpd')
    end

    it 'removes the mod_ssl package' do
      expect(chef_run).to remove_package('mod_ssl')
    end
    it 'deletes the /var/www directory' do
      expect(chef_run).to delete_directory('/var/www')
    end
  end
end
    
