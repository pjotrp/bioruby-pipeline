
require 'bio-pipeline/template'
require 'yaml'

module BioPipeline

  class YamlJob 

    include Template
  
    def initialize template
      @template = template
    end

    def run
      Dir::mkdir('output') if not File.directory?('output')
      y = YAML.load(parse_erb)
      y[:commands].each do | cmd |
        p cmd
        Kernel::system(cmd)
      end
    end

  end

end
