# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{case_collection_observer}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Szymon Czarnecki"]
  s.date = %q{2009-09-21}
  s.description = %q{Simple notifier for object in HM and HABTM associations in AR...}
  s.email = %q{spirit_sc@thinkdifferent.pl}
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README", "lib/case_collection_observer.rb", "lib/case_collection_observer/base.rb", "lib/case_collection_observer/version.rb", "lib/casecollectionobserver.rb"]
  s.files = ["CHANGELOG", "LICENSE", "Manifest", "README", "Rakefile", "generators/case_observer/USAGE", "generators/case_observer/case_observer_generator.rb", "generators/case_observer/templates/case_collection_observer.rb", "generators/case_observer/templates/case_collection_observer_test.rb", "init.rb", "lib/case_collection_observer.rb", "lib/case_collection_observer/base.rb", "lib/case_collection_observer/version.rb", "lib/casecollectionobserver.rb", "case_collection_observer.gemspec"]
  s.homepage = %q{http://github.com/SpiritSC/Case-Collection-Observer}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Case_collection_observer", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{case_collection_observer}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Simple notifier for object in HM and HABTM associations in AR...}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
