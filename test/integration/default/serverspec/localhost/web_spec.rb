require 'spec_helper'

if os[:family] == 'ubuntu'
  describe '/etc/lsb-release' do
    it "exists" do
      expect(file('/etc/lsb-release')).to be_file
    end
  end

  describe package('apache2'), :if => os[:family] == 'ubuntu' do
    it { should be_installed }
  end

  describe port(80) do
    it { should be_listening }
  end

  describe file('/var/www/html/index.html') do
    it { should exist }
  end

  #describe file('/var/www/html/about.html') do
  #  it { should exist }
  #end

end
