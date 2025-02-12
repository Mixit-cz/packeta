lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "packeta/version"

Gem::Specification.new do |spec|
  spec.name          = "packeta"
  spec.version       = Packeta::VERSION
  spec.authors       = ["Michal Gritzbach"]
  spec.email         = ["gritzbach.michal@gmail.com"]

  spec.summary       = "API wrapper for Packeta delivery service."
  spec.homepage      = "https://github.com/Mixit-cz/packeta"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Mixit-cz/packeta"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "dry-struct", "~> 1.3"
  spec.add_dependency "dry-types", "~> 1.4"
  spec.add_dependency "http", "~> 4.4"
  spec.add_dependency "libxml-ruby", "~> 5.0.2"
  spec.add_dependency "oj", "~> 3.10"
  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
