require 'rake'

desc "install the script files into user's 'bin' directory"
task :install do
  Dir.chdir(ENV['HOME']) { Dir.mkdir("bin") } unless File.directory? "#{ENV['HOME']}/bin"
  Dir['*'].each do |file|
    next if %w[Rakefile README.markdown LICENSE].include? file
    puts "copy #{file} to -> #{ENV['HOME']}/bin"
    `cp -i #{file} #{ENV['HOME']}/bin`
    `chmod 755 #{ENV['HOME']}/bin/#{file}`
  end
end
