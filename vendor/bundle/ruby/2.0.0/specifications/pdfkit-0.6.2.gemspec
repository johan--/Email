# -*- encoding: utf-8 -*-
# stub: pdfkit 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pdfkit"
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jared Pace", "Relevance"]
  s.date = "2014-03-20"
  s.description = "Uses wkhtmltopdf to create PDFs using HTML"
  s.email = ["jared@codewordstudios.com"]
  s.homepage = "https://github.com/pdfkit/pdfkit"
  s.require_paths = ["lib"]
  s.rubyforge_project = "pdfkit"
  s.rubygems_version = "2.1.9"
  s.summary = "HTML+CSS -> PDF"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>, [">= 3.0.8"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.10"])
      s.add_development_dependency(%q<rack-test>, [">= 0.5.6"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.2.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.8"])
      s.add_dependency(%q<mocha>, [">= 0.9.10"])
      s.add_dependency(%q<rack-test>, [">= 0.5.6"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<rdoc>, ["~> 4.0.1"])
      s.add_dependency(%q<rspec>, ["~> 2.2.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.8"])
    s.add_dependency(%q<mocha>, [">= 0.9.10"])
    s.add_dependency(%q<rack-test>, [">= 0.5.6"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<rdoc>, ["~> 4.0.1"])
    s.add_dependency(%q<rspec>, ["~> 2.2.0"])
  end
end
