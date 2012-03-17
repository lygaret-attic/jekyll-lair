require 'bundler/setup'
require './lib/config'
require 'fssm'

config = Lair::Config.load("_config.yml")

desc "Write out the jekyll-lair configuration."
task :config do |t, args|
  puts config
end

desc "Generate the jekyll output."
task :generate do |t, args|
  `jekyll`
end

desc "Run a preview server."
task :preview do |t, args|
  begin
    jekyll = Process.fork { exec("jekyll --auto --server") }
    
    # watch the config file, and restart the jekyll watcher
    FSSM.monitor("./", "./_config.yml") do      
      update {
        pid = Process.fork { exec("jekyll --auto --server") }                      
        Process.kill("INT", jekyll) if jekyll
        jekyll = pid
      }
    end
    
    Process.waitall
  ensure
    Process.kill("INT", jekyll) if jekyll
  end
end

desc "Create an archive of the public directory."
task :archive => [:generate] do |t, args|
  command = case
    when config.archive.format == "zip"
      "zip -r #{config.archive.destination} public"
    when config.archive.format == "tar"
      "tar -czf #{config.archive.destination} public"
    else
      raise "Unknown archive format `#{config.archive.format}`. Please use 'zip' or 'tar'."
  end
  
  `#{command}`
end