require 'bundler/setup'
require './lib/config'
require 'fssm'

config = Lair::Config.load("_config.yml")

desc "Write out the jekyll-lair configuration."
task :config do |t, args|
  puts config
end

desc "Run a preview server."
task :preview do |t, args|
  begin
    jekyll = Process.fork { exec("jekyll --auto") }
    rackup = Process.fork { exec("rackup -p #{config.preview.port}") }
  
    # watch the config file, and restart the jekyll watcher
    FSSM.monitor("./", "./_config.yml") do
      update {
        Process.kill("INT", jekyll) if jekyll
        jekyll = Process.fork { exec("jekyll --auto") }              
      }
    end
    
    Process.waitall
  ensure
    Process.kill("INT", jekyll) if jekyll
    Process.kill("INT", rackup) if rackup
  end
end

desc "Create an archive of the public directory."
task :archive do |t, args|
  
end