# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-juggernaut}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ripta Pasay"]
  s.date = %q{2008-12-05}
  s.description = %q{A chunky slice of Juggernaut pie.}
  s.email = %q{github@r8y.org}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/merb-juggernaut", "lib/merb-juggernaut/commands.rb", "lib/merb-juggernaut/merbtasks.rb", "lib/merb-juggernaut/slicetasks.rb", "lib/merb-juggernaut/spectasks.rb", "lib/merb-juggernaut.rb", "spec/controllers", "spec/controllers/main_spec.rb", "spec/merb-juggernaut_spec.rb", "spec/models", "spec/models/chat_demo_spec.rb", "spec/requests", "spec/requests/chat_demos_spec.rb", "spec/spec_helper.rb", "app/controllers", "app/controllers/application.rb", "app/controllers/chat_demos.rb", "app/controllers/main.rb", "app/helpers", "app/helpers/application_helper.rb", "app/helpers/chat_demos_helper.rb", "app/models", "app/models/chat_demo.rb", "app/views", "app/views/chat_demos", "app/views/chat_demos/edit.html.erb", "app/views/chat_demos/index.html.erb", "app/views/chat_demos/new.html.erb", "app/views/chat_demos/show.html.erb", "app/views/layout", "app/views/layout/merb_juggernaut.html.erb", "app/views/main", "app/views/main/index.html.erb", "public/javascripts", "public/javascripts/jquery-1.2.6.js", "public/javascripts/jquery.json.js", "public/javascripts/jquery.juggernaut.js", "public/javascripts/juggernaut.js", "public/javascripts/master.js", "public/javascripts/swfobject.js", "public/media", "public/media/expressinstall.swf", "public/media/juggernaut.as", "public/media/juggernaut.swf", "public/stylesheets", "public/stylesheets/master.css", "stubs/app", "stubs/app/controllers", "stubs/app/controllers/application.rb", "stubs/app/controllers/main.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/ripta/merb-juggernaut}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A chunky slice of Juggernaut pie.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_runtime_dependency(%q<juggernaut>, [">= 0.5.7"])
    else
      s.add_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_dependency(%q<juggernaut>, [">= 0.5.7"])
    end
  else
    s.add_dependency(%q<merb-slices>, [">= 1.0"])
    s.add_dependency(%q<juggernaut>, [">= 0.5.7"])
  end
end
