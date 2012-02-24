require "dust_assets/version"

module DustAssets
  PATH = File.expand_path("../../vendor/assets/javascripts", __FILE__)

  def self.path
    PATH
  end

  autoload(:Dust, 'dust_assets/dust')
  autoload(:TiltDust, 'dust_assets/tilt_dust')

  if defined?(Rails)
    require 'dust_assets/engine'
  else
    require 'sprockets'
    Sprockets.register_engine '.dust', TiltDust
  end
end
