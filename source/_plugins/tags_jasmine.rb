module Jekyll
  
  # {% timestamp %} => 2089309470982
  class AllSpecsTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      files = Dir.glob("source/spec/*.{js,coffee}")
      files = files.map do |filename|
        dir = File.dirname(filename).sub("source/", "")
        file = File.basename(filename, File.extname(filename))
        path = File.join(dir, file) + ".js"
        "<script src='/#{path}?#{Time.now.to_i}' type='text/javascript'/></script>"
      end
      files.join("\n")
    end
  end
end

Liquid::Template.register_tag('jasminespecs', Jekyll::AllSpecsTag)