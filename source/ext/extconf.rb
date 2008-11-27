require 'mkmf'
require 'ftools'

# check if Subversion, SWIG and SCons are installed
if xsystem('which svn') == false
  puts 'Subversion is not installed'
  exit 1
end
if xsystem('which swig') == false
  puts 'SWIG is not installed'
  exit 1
end
if xsystem('which scons') == false
  puts 'SCons is not installed'
  exit 1
end

# determine os name
if RUBY_PLATFORM =~ /darwin/i
	rb_os = '__OSX'
elsif RUBY_PLATFORM =~ /cygwin/i
	rb_os = '__CYGWIN'
elsif RUBY_PLATFORM =~ /win32/i
	rb_os = '__CYGWIN'
elsif RUBY_PLATFORM =~ /linux/i
	rb_os = '__LINUX'
elsif RUBY_PLATFORM =~ /irix6/i
	rb_os = '__IRIX'
end

# try to do a SVN checkout
if xsystem('svn co --non-interactive https://ssl.drqueue.org/svn/branches/0.64.x') == false
  puts 'SVN checkout failed'
  exit 1
end

# try to build drqueue
Dir::chdir '0.64.x' 
if xsystem('scons build_drqman=false') == false
  puts 'DrQueue build failed'
  exit 1
end
Dir::chdir '..'

# create swig wrapper
puts 'generating swig interface file'
puts 'swig -ruby -I0.64.x/ -I0.64.x/libdrqueue -D'+rb_os+' -Wall -autorename libdrqueue_ruby.i'
xsystem('swig -ruby -I0.64.x/ -I0.64.x/libdrqueue -D'+rb_os+' -Wall -autorename libdrqueue_ruby.i')
puts 'look for output in mkmf.log'

# build for os
$CFLAGS += ' -D'+rb_os

# include the headers
$CFLAGS += ' -I0.64.x/ -I0.64.x/libdrqueue'

# path to the drqueue lib
$LOCAL_LIBS += '0.64.x/libdrqueue/libdrqueue.a'

# create the makefile
create_makefile('drqueue')
