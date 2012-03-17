module Jekyll

  # Sass plugin to convert .scss to .css
  class SassConverter < Converter
    def initialize(config)
      require 'sass' unless (defined?(::Sass))
      sconfig = { "syntax" => :scss, "load_paths" => ["./css/"] }.merge(config['sass'] || {})
      @config = sconfig.inject({}) { |i, (k, v)| i[k.to_sym] = v; i }
    rescue LoadError
      STDERR.puts 'You are missing a library required for Sass. Please run:'
      STDERR.puts '  $ [sudo] gem install sass'
      STDERR.puts 'Skipping SASS generation.'
    end

    def matches(ext)
      ext =~ /\.#{@config[:syntax].to_s}/io
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      begin
        return content unless (defined?(::Sass))
        engine = Sass::Engine.new(content, @config)
        engine.render
      rescue StandardError => e
        puts "!!! SASS Error: " + e.message
      end
    end
  end
  
end