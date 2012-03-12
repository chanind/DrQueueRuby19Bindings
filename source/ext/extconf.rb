require 'mkmf'
require 'fileutils'

# check if Git, SWIG and SCons are installed
if xsystem('which git') == false
  puts 'Git is not installed'
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

if File.directory? "drqueue"
  Dir::chdir 'drqueue/src'
  # try to do a Git pull
  if xsystem('git pull') == false
    puts 'Git pull failed'
    exit 1
  end
else
  # try to do a Git clone
  if xsystem('git clone https://ssl.drqueue.org/git/drqueue.git') == false
    puts 'Git clone failed'
    exit 1
  end
  Dir::chdir 'drqueue/src'
end

# try to build libdrqueue
if xsystem('scons universal_binary=true build_drqman=false libdrqueue') == false
  puts 'libdrqueue build failed'
  exit 1
end
Dir::chdir '../..'

# create swig wrapper
puts 'generating swig interface file'
puts 'swig -ruby -Idrqueue/src/ -Idrqueue/src/libdrqueue -D'+rb_os+' -Wall -autorename libdrqueue_ruby.i'
xsystem('swig -ruby -Idrqueue/src/ -Idrqueue/src/libdrqueue -D'+rb_os+' -Wall -autorename libdrqueue_ruby.i')
puts 'look for output in mkmf.log'

# build for os
$CFLAGS += ' -D'+rb_os

# include the headers
$CFLAGS += ' -Idrqueue/src/ -Idrqueue/src/libdrqueue'

# path to the drqueue lib
$LOCAL_LIBS += 'drqueue/src/libdrqueue/libdrqueue.a'

# create the makefile
create_makefile('drqueue')
