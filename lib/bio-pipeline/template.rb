require 'erb'

module BioPipeline

  module Template

    def parse_erb buf = nil, opts = {}
      buf = @template if not buf
      output_dir = opts[:output_dir] || 'tmp'
      # in_file = 'LICENSE.txt'
      t = ERB.new(buf)
      t.result(binding)
    end

  end

end
