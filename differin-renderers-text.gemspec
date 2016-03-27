# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'differin-renderers-text'
  spec.version       = '0.1.0'
  spec.authors       = ['Andrew Emelianenko']
  spec.email         = ['emelianenko.web@gmail.com']

  spec.summary       = 'Renderer for `differin`'
  spec.description   = 'Render diff of files as text'
  spec.homepage      = 'http://github.com/MrEmelianenko/differin-renderers-text'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'differin', '~> 0.1.0'
  spec.add_development_dependency 'colorize', '~> 0.7.7'
end
