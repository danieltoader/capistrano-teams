require_relative 'lib/capistrano/teams/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-teams'
  spec.version       = Capistrano::Teams::VERSION
  spec.authors       = ['Daniel Toader']
  spec.email         = ['developer@danieltoader.com']

  spec.summary       = 'Microsoft Teams integration for Capistrano 3.x'
  # spec.description   = %q{Microsoft Teams integration for Capistrano 3.x}
  spec.homepage      = 'https://rubygems.org/gems/capistrano-teams'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.0.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/danieltoader/capistrano-teams'
  spec.metadata['changelog_uri'] = 'https://github.com/danieltoader/capistrano-teams/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'
  spec.add_development_dependency 'bundler', '>= 1.16'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
end
