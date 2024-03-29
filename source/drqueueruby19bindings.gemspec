# Gem::Specification for DrQueueRubyBindings

Gem::Specification.new do |s|
  s.name = %q{DrQueueRuby19Bindings}
  s.version = "0.5"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Andreas Schroeder", "David Chanin"]
  s.email = %q{andreas@drqueue.org}
  s.extensions = ["ext/extconf.rb"]
  s.files = ["COPYING", "ext/libdrqueue_ruby.i"]
  s.has_rdoc = false
  s.homepage = %q{http://www.drqueue.org}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.requirements = ["Ruby 1.9.x bindings for DrQueue"]
  s.rubyforge_project = %q{drqueue}
  s.summary = %q{Ruby extension library providing an API to DrQueue}
  s.description = %q{This gem is a Ruby extension library providing an API to DrQueue, the open source render queue. Git, SWIG and SCons are required for building. See https://ssl.drqueue.org/redmine/projects/drqueue/wiki/RubyBindingsHowto for more information.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1
  end
end
