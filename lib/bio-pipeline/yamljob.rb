
require 'bio-pipeline/template'
require 'yaml'

module BioPipeline

  class YamlJob 

    include Template
  
    def initialize template
      @template = template
    end

    def run opts
      output_dir = opts[:output_dir] || 'tmp'
      Dir::mkdir(output_dir) if not File.directory?(output_dir)
      y = YAML.load(parse_erb(@template,opts))
      y[:commands].each do | cmd |
        print "Executing: ",cmd,"\n"
        Kernel::system(cmd)
      end
    end

  end

end
