require 'rails/generators'
module AssetSync
  class InstallGenerator < Rails::Generators::Base
    desc "Install a config/asset_sync.yml and the asset:precompile rake task enhancer"

    # Commandline options can be defined here using Thor-like options:
    class_option :use_yml,   :type => :boolean, :default => false, :desc => "Use YML file instead of Rails Initializer"
    class_option :provider,  :type => :string,  :default => "AWS",  :desc => "Generate with support for 'AWS', 'Rackspace', 'Google', 'AzureRM', or 'Backblaze'"

    def self.source_root
      puts "INVOKING: #{self.class.name}::self.source_root"
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def aws?
      puts "INVOKING: #{self.class.name}::aws?"
      options[:provider] == 'AWS'
    end

    def google?
      puts "INVOKING: #{self.class.name}::google?"
      options[:provider] == 'Google'
    end

    def rackspace?
      puts "INVOKING: #{self.class.name}::rackspace?"
      options[:provider] == 'Rackspace'
    end

    def azure_rm?
      puts "INVOKING: #{self.class.name}::azure_rm?"
      options[:provider] == 'AzureRM'
    end

    def backblaze?
      puts "INVOKING: #{self.class.name}::backblaze?"
      options[:provider] == 'Backblaze'
    end

    def aws_access_key_id
      puts "INVOKING: #{self.class.name}::aws_access_key_id"
      "<%= ENV['AWS_ACCESS_KEY_ID'] %>"
    end

    def aws_secret_access_key
      puts "INVOKING: #{self.class.name}::aws_secret_access_key"
      "<%= ENV['AWS_SECRET_ACCESS_KEY'] %>"
    end

    def aws_session_token
      puts "INVOKING: #{self.class.name}::aws_session_token"
      "<%= ENV['AWS_SESSION_TOKEN'] %>"
    end

    def google_storage_access_key_id
      puts "INVOKING: #{self.class.name}::google_storage_access_key_id"
      "<%= ENV['GOOGLE_STORAGE_ACCESS_KEY_ID'] %>"
    end

    def google_storage_secret_access_key
      puts "INVOKING: #{self.class.name}::google_storage_secret_access_key"
      "<%= ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY'] %>"
    end

    def rackspace_username
      puts "INVOKING: #{self.class.name}::rackspace_username"
      "<%= ENV['RACKSPACE_USERNAME'] %>"
    end

    def rackspace_api_key
      puts "INVOKING: #{self.class.name}::rackspace_api_key"
      "<%= ENV['RACKSPACE_API_KEY'] %>"
    end

    def azure_storage_account_name
      puts "INVOKING: #{self.class.name}::azure_storage_account_name"
      "<%= ENV['AZURE_STORAGE_ACCOUNT_NAME'] %>"
    end

    def azure_storage_access_key
      puts "INVOKING: #{self.class.name}::azure_storage_access_key"
      "<%= ENV['AZURE_STORAGE_ACCESS_KEY'] %>"
    end

    def b2_key_id
      puts "INVOKING: #{self.class.name}::b2_key_id"
      "<%= ENV['B2_KEY_ID'] %>"
    end

    def b2_key_token
      puts "INVOKING: #{self.class.name}::b2_key_token"
      "<%= ENV['B2_KEY_TOKEN'] %>"
    end

    def b2_bucket_id
      puts "INVOKING: #{self.class.name}::b2_bucket_id"
      "<%= ENV['B2_BUCKET_ID'] %>"
    end

    def app_name
      puts "INVOKING: #{self.class.name}::app_name"
      @app_name ||= Rails.application.is_a?(Rails::Application) && Rails.application.class.name.sub(/::Application$/, "").downcase
    end

    def generate_config
      puts "INVOKING: #{self.class.name}::generate_config"
      if options[:use_yml]
        template "asset_sync.yml", "config/asset_sync.yml"
      end
    end

    def generate_initializer
      puts "INVOKING: #{self.class.name}::generate_initializer"
      unless options[:use_yml]
        template "asset_sync.rb", "config/initializers/asset_sync.rb"
      end
    end

  end
end
