# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dust_assets/version"

Gem::Specification.new do |s|
  s.name        = "dust_assets"
  s.version     = DustAssets::VERSION
  s.authors     = ["Anderson Sequera", "Jose Narvaez", "Manuel Mujica"]
  s.email       = ["andersonsp24@gmail.com", "goyox86@gmail.com", "evilsaurer@gmail.com"]
  s.homepage    = "http://github.com/hasmanydevelopers/dust_assets"
  s.summary     = "Compile Dust templates in the Rails asset pipeline."
  s.description = "Compile Dust templates in the Rails asset pipeline."

  s.rubyforge_project = "dust_assets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "execjs", ">= 1.2.9"
  s.add_runtime_dependency "tilt"
  s.add_runtime_dependency "sprockets", ">= 2.0.3"
end
