Gem::Specification.new do |s|
  s.name        = 'gosu_api'
  s.version     = '0.0.1'
  s.date        = '2016-04-05'
  s.summary     = "Gem for communicating with the GosuGamers.net API"
  s.description = "Gem for communicating with the GosuGamers.net API"
  s.authors     = ["Stefan Dorresteijn"]
  s.email       = 'stefan@refreshseo.nl'
  s.files       = ["lib/gosu_api.rb", "lib/gosu_api/gosu_api.rb", "lib/gosu_api/matchticker.rb", "lib/gosu_api/exceptions/forbidden_error.rb", "lib/gosu_api/configuration.rb", "lib/generators/gosu_api/install/templates/gosu_api.rb", "lib/generators/gosu_api/install/install_generator.rb"]
  s.homepage    = 'https://github.com/StefanDorresteijn/GosuAPI'
  s.license     = 'MIT'


  # Gem dependencies
  s.add_dependency 'rest-client'
  s.add_development_dependency 'byebug'
end