class Rails::Railtie::Configuration
  def asset_sync
    puts "INVOKING: Rails::Railtie::Configuration::asset_sync"
    AssetSync.config
  end
end
