# bio-pipeline

[![Build Status](https://secure.travis-ci.org/pjotrp/bioruby-pipeline.png)](http://travis-ci.org/pjotrp/bioruby-pipeline)

Common pipeline tasks. This Bio module does not do the work of a job
scheduler, for this you can choose to use our simple [Ruby Queue
(rq)](https://github.com/pjotrp/rq) from many other schedulers.

bio-pipeline, meanwhile, addresses DRY principles for creating tasks
at the job level. For example, bio-pipeline comes with a library of
templates, mostly based on YAML and ERB, for common bioinformatics
tasks. Also bio-pipeline has the run-once command, which caches
results and won't calculate the same result twice.

## YAML/erb templates

In order to describe a job that can be run in a pipeline, we introduce
a data structure in YAML, which acts also as a template preparsed by
erb. An example for running an alignment program would be

```yaml
    :inputs:
      - <%= in_file = 'aa.fa' %>      # here we set in_file too!
    :commands:
      - <%= muscle_bin %> -i <%= in_file %> -o <%= output_dir %>/aa-align.fa
    :outputs:
      - <%= output_dir %>             # defaults to ./output
```

Note that in_file gets defined in the YAML file, while muscle_bin and output_dir 
are defined by the calling context. Run this command from the command line with

```bash
  ./bin/runner -c muscle.yaml
```

The idea is to have richer meta-data possibilities, and rather than
using commands on the command line we can easily share common tasks,
add context, paths, and features like creating and copying the output_dir. 

To set/override parameters, they can be added on the command line

```bash
  ./bin/runner -c muscle.yaml -output_dir tmp -muscle_bin /opt/muscle/bin/muscle
```

Note: this software is under active development! Feel free to pitch in.

## Installation

(sorry, not ready yet!)

```sh
    gem install bio-pipeline
```

## Usage

```ruby
    require 'bio-pipeline'
```

The API doc is online. For more code examples see the test and feature files in
the source tree.
        
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/pjotrp/bioruby-pipeline

The BioRuby community is on IRC server: irc.freenode.org, channel: #bioruby.

## Cite

If you use this software, please cite one of
  
* [BioRuby: bioinformatics software for the Ruby programming language](http://dx.doi.org/10.1093/bioinformatics/btq475)
* [Biogem: an effective tool-based approach for scaling up open source software development in bioinformatics](http://dx.doi.org/10.1093/bioinformatics/bts080)

## Biogems.info

This Biogem is published at [#bio-pipeline](http://biogems.info/index.html)

## Copyright

Copyright (c) 2012 Pjotr Prins. See LICENSE.txt for further details.

