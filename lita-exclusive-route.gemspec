Gem::Specification.new do |spec|
  spec.name          = "lita-exclusive-route"
  spec.version       = "0.0.1"
  spec.authors       = ["Roy Hadrianoro"]
  spec.email         = ["dev@maysora.com"]
  spec.description   = %q{A Lita extension to allow exclusive route}
  spec.summary       = %q{A Lita extension to allow exclusive route}
  spec.homepage      = "http://www.bocistudio.com"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "extension" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
