
require 'erb'
require 'yaml'

module BioPipeline

  class YamlJob 
  
    def initialize template
      @template = template
    end

    def run
      Dir::mkdir('output') if not File.directory?('output')
      y = parse_yaml(parse_erb)
      y[:commands].each do | cmd |
        p cmd
        Kernel::system(cmd)
      end
    end

    # helper method
    def parse_erb buf = nil
      buf = @template if not buf
      in_file = 'LICENSE.txt'
      output_dir = 'output'
      t = ERB.new(buf)
      t.result(binding)
    end

    # helper method
    def parse_yaml buf
      YAML.load(buf)
    end

  end

end
