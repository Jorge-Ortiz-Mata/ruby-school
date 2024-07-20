# github_client/github_client.gemspec

Gem::Specification.new do |spec|
  spec.name          = "github_client"
  spec.version       = "1.0.0"
  spec.authors       = ["Your Name"]
  spec.email         = ["your_email@example.com"]
  spec.summary       = "A short summary of github_client."
  spec.description   = "A longer description of github_client."
  spec.homepage      = "http://example.com/github_client"
  spec.license       = "MIT"
  
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
end
