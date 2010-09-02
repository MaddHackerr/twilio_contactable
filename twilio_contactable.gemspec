# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twilio_contactable}
  s.version = "0.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2010-09-02}
  s.description = %q{Does all the hard work with letting you confirm your user's phone numbers for Voice or TXT over the Twilio API}
  s.email = %q{gitcommit@6brand.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "MIT-LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/configuration.rb",
     "lib/contactable.rb",
     "lib/controller.rb",
     "lib/gateway.rb",
     "lib/twilio_contactable.rb",
     "test/.gitignore",
     "test/database.yml",
     "test/test_helper.rb",
     "test/twilio_contactable_contactable_test.rb",
     "test/twilio_contactable_controller_test.rb",
     "test/twilio_module_test.rb",
     "twilio_contactable.gemspec"
  ]
  s.homepage = %q{http://github.com/JackDanger/twilio_contactable}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Help authorize the users of your Rails apps to confirm and use their phone numbers}
  s.test_files = [
    "test/test_helper.rb",
     "test/twilio_contactable_contactable_test.rb",
     "test/twilio_contactable_controller_test.rb",
     "test/twilio_module_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<twiliolib>, [">= 2.0.5"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<twiliolib>, [">= 2.0.5"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<twiliolib>, [">= 2.0.5"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

