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

