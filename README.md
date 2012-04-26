# bio-pipeline

[![Build Status](https://secure.travis-ci.org/pjotrp/bioruby-pipeline.png)](http://travis-ci.org/pjotrp/bioruby-pipeline)

Common pipeline tasks. This Bio module does not do the work of a job
scheduler, for this you can choose to use our simple [Ruby Queue
(rq)](https://github.com/pjotrp/rq) from many other schedulers.

bio-pipeline, meanwhile, addresses do-not-repeat-yoursefl (DRY)
principles for creating tasks at the job level, and aims for
convention-over-configuration (CoC). For example, bio-pipeline comes
with a library of templates, mostly based on YAML and ERB, for common
bioinformatics tasks. 

Also bio-pipeline has the run-once command, which caches results and
won't calculate the same result twice.

You do not need to know Ruby to use bio-pipeline.

Note: this software is under active development! Feel free to pitch in.

## task files as YAML/erb templates

In order to describe a job that can be run in a pipeline, we introduce
a data structure in YAML, a task file, which acts also as a template preparsed by
erb. An example for running an alignment program would be

```ruby
    # task file: muscle.yaml
    :inputs:
      - <%= in_file = 'aa.fa' %>      # here we set in_file too!
    :commands:
      - <%= muscle_bin %> -i <%= in_file %> -o <%= output_dir %>/aa-align.fa
    :outputs:
      - <%= output_dir %>             # defaults to ./output
```

Note that *in_file* gets defined in the YAML task file, while
*muscle_bin* and *output_dir* are defined by the calling context. Run
this command from the command line with

```bash
  ./bin/runner -c muscle.yaml
```

The idea is to have richer meta-data possibilities, and rather than
using commands on the command line we can easily share common tasks,
add context, paths, and features like creating and copying the *output_dir*. 

To set/override parameters outside the template, they can also be added on
the command line as switches:

```bash
  ./bin/runner -c muscle.yaml -output_dir tmp -muscle_bin /opt/muscle/bin/muscle
```

the runner handles that by copying the switches into the name space - using some nice
Ruby magic.

erb executes the Ruby between <% and %> on compiling the template.
After this, at runtime, you can run Ruby programs as scripts, but you
can also call into the bio-pipeline engine and libraries. A command is
always checked if it exists as a method in the engine's namespace
first. So if a command exists as a method the rest of the command is
executed as Ruby in the local interpreter. For example

```ruby
    :commands:
      - BioPipeline::report(<%= in_file %>,<%= output_dir %>/aa-align.fa)
```

Within the task file commands section, commands are simply executed in
sequence.

## Chaining task files

Chaining tasks allows modularising work in task files - so each task file 
represents as few steps as possible. To chain we want 

1. to call the next task file
2. to pass in new inputs (including output of the current task)

(more soon)

## run-once

(coming soon) 

## map reduce and dependencies

(coming soon)

## more documentation

Features describe the behaviour of bio-pipeline. More documentation
can also be found

* [Settings, variables and environment](https://github.com/pjotrp/bioruby-pipeline/blob/master/doc/bio-pipeline-environment.md)
* [Listed features](https://github.com/pjotrp/bioruby-pipeline/blob/features/)

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

