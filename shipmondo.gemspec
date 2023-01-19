Gem::Specification.new do |spec|
  spec.name = 'shipmondo'
  spec.version = '0.1.0'
  spec.summary = 'Shipmondo API Client'
  spec.description = 'Ruby Client for Shipmondo'
  spec.authors = ['Mads Lundholm <mads@madslundholm.dk>'],
  spec.email = 'ml@whitelabels.dk',
  spec.files = Dir["lib/**/*.rb"]
  spec.homepage = 'https://github.com/whitelabels/shipmondo'
  spec.metadata = { 'source_code_uri' => 'https://github.com/whitelabels/shipmondo' }

  spec.required_ruby_version = '~> 3.1.2'
  spec.add_runtime_dependency 'faraday', '~> 2.3.0'
  spec.add_runtime_dependency 'dry-struct', '~> 1.6.0'
  spec.add_runtime_dependency 'dry-types', '~> 1.7.0'

  spec.add_development_dependency 'rspec', '~> 3.11.0'
  spec.add_development_dependency 'webmock', '~> 3.14.0'
end
