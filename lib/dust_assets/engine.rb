module DustAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.dust", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine('.dust', TiltDust)
    end
  end
end
