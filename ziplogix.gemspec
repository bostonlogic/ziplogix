
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ziplogix/version"

Gem::Specification.new do |spec|
  spec.name          = "ziplogix"
  spec.version       = Ziplogix::VERSION
  spec.authors       = ["Mwaki Harri Magotswi"]
  spec.email         = ["mmagotswi@bostonlogic.com"]

  spec.summary       = %q{Ruby library for Ziplogix API}
  spec.description   = %q{A Ruby wrapper Ziplogix API, focusing on transaction management}
  spec.homepage      = "https://github.com/bostonlogic/ziplogix"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = spec.homepage
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

  spec.add_dependency 'virtus', '~> 2.0.0'
  spec.add_dependency "resource_kit", '~> 0.1.7'
  spec.add_dependency "kartograph", '~> 0.2.8'
  spec.add_dependency "faraday", '>= 0.15.0'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
end
