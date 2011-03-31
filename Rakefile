require 'rake'

desc "install the script files into user's 'bin' directory"
task :install do
  Dir.chdir(ENV['HOME']) { Dir.mkdir("bin") } unless File.directory? "#{ENV['HOME']}/bin"
  Dir['bin/*'].each do |file|
    puts "copy #{file} to -> #{ENV['HOME']}/bin"
    `cp -i #{file} #{ENV['HOME']}/bin`
    `chmod 777 #{ENV['HOME']}/#{file}`
  end
end
