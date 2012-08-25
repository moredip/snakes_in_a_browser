VERBATIM_DIRS = %w{images javascripts}

ignore /\.swp$/, /^public/



guard :haml, :input => 'source', :output => 'public', :run_at_start => true do
	watch( %r{^source/(.+)\.haml$} )
end

guard 'coffeescript', :input => 'source/coffeescripts', :output => 'public/javascripts'

guard 'coffeescript', :input => 'specs', :output => 'public/javascripts/specs/'

VERBATIM_DIRS.each do |dir|
  `mkdir -p public/#{dir}`
  guard :copy, :from => "source/#{dir}", :to => "public/#{dir}", :verbose => true, :create_target => true
end
