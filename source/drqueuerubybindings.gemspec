# Gem::Specification for DrQueueRubyBindings

Gem::Specification.new do |s|
  s.name = %q{DrQueueRubyBindings}
  s.version = "0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Andreas Schroeder"]
  s.cert_chain = nil
  s.date = %q{2008-11-24}
  s.email = %q{andreas@drqueue.org}
  s.extensions = ["ext/extconf.rb"]
  s.files = ["COPYING", "ext/libdrqueue_ruby.i"]
  s.has_rdoc = false
  s.homepage = %q{http://www.drqueue.org}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.requirements = ["Ruby bindings for DrQueue"]
  s.rubyforge_project = %q{drqueue}
  s.summary = %q{Ruby extension library providing an API to DrQueue}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if current_version >= 3 then
    else
    end
  else
  end
end