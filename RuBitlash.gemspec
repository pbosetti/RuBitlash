# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubitlash}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paolo Bosetti"]
  s.date = %q{2009-07-03}
  s.description = %q{Rubitlash is a Ruby interface with Bitlash for Arduino}
  s.email = %q{paolo.bosetti@me.com}
  s.files = ["README.markdown", "lib/rubitlash.rb", "example/simple.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pbosetti/rubitlash}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rubitlash}
  s.rubygems_version = %q{1.2.0}
  s.has_rdoc = true
  s.summary = %q{Rubitlash is a Ruby interface with Bitlash for Arduino}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-serialport>, [">= 0.6.0"])
    else
      s.add_dependency(%q<ruby-serialport>, [">= 0.6.0"])
    end
  else
    s.add_dependency(%q<ruby-serialport>, [">= 0.6.0"])
  end
end