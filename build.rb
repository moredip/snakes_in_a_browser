require 'fileutils'

require "bundler/setup"


# annoying manual work around because the touch files technique doesn't work for symlinks
`mkdir -p public/javascripts/lib/ && cp source/javascripts/lib/*.js public/javascripts/lib/`
`mkdir -p public/stylesheets/ && cp source/stylesheets/*.css public/stylesheets/`


def run_guard
  Signal.trap("HUP") { exit }

  require 'guard'
  Guard.setup
  Guard::Dsl.evaluate_guardfile(:guardfile => 'Guardfile')
  Guard.start
end

guard_pid = fork { run_guard }

sleep 2

Dir['source/**/*'].each{ |f| FileUtils.touch(f) }

sleep 2

Process.kill "HUP", guard_pid
Process.wait( guard_pid )
