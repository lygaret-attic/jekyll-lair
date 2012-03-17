require 'yaml'

module Lair
  class Config
    @@lair_defaults = {
      "preview" => { "port" => 4500 },
      "archive" => { "output" => "archive", "format" => "zip" },
      "generate" => {
        "page" => { "layout" => "default" },
        "post" => { "layout" => "post" }
      },
      "ghpages" => {
        "source_branch" => "source",
        "public_branch" => "master"
      }
    }

    def self.load(filename)
      sconfig = YAML::load(File.open(filename))
      sconfig = @@lair_defaults.merge(sconfig['lair'] || {})
      sconfig.to_openstruct()
    end
  end
end

class Object
  def to_openstruct
    self
  end
end

class Array
  def to_openstruct
    map{ |el| el.to_openstruct }
  end
end

class Hash
  def to_openstruct
    mapped = {}
    each { |key,value| mapped[key] = value.to_openstruct }
    OpenStruct.new(mapped)
  end
end

module YAML
  def self.load_openstruct(source)
    self.load(source).to_openstruct
  end
end