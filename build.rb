require 'fileutils'

require "bundler/setup"

def run_guard
  Signal.trap("HUP") { exit }

  require 'guard'
  Guard.setup
  Guard::Dsl.evaluate_guardfile(:guardfile => 'Guardfile')
  Guard.start
end

guard_pid = fork { run_guard }

sleep 2

Dir['{specs,source}/**/*'].each{ |f| FileUtils.touch(f) }

sleep 2

Process.kill "HUP", guard_pid
Process.wait( guard_pid )

`npm run-script minify`
