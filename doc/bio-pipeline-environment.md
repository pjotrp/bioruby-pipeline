# bio-pipeline settings, variables and environment

bio-pipeline addresses do-not-repeat-yoursefl (DRY) principles for
creating tasks at the job level, and aims for
convention-over-configuration (CoC). 

In this document we describe the environment that bio-pipeline
operates in. The environment potentially has to be passed into a
job-scheduler which puts constraints on a job. For example, the
environment PATH may not be set, or complete, when running on a
different machine in a cluster.

For creating reusable templates, with DRY and CoC in mind, it is
critical for bio-pipeline to correctly deal with search paths, whether
they are for searching binaries, source repositories, data and data
storage.

## Task templates

A job is described in a YAML task file template. For example

```ruby
    # task file: muscle.yaml
    :inputs:
      - <%= in_file = 'aa.fa' %>      # here we set in_file too!
    :commands:
      - <%= muscle_bin %> -i <%= in_file %> -o <%= output_dir %>/aa-align.fa
    :outputs:
      - <%= output_dir %>             # defaults to ./output
```

some variables used in the template, such as *in_file* are defined
inside the template. This should be limited, as these variables are
not so variable when templates are shared, and they can not be
overridden. Here it may be acceptable, if we assume the data is always
made availble in a file named 'aa.fa' and we refer to the same
*in_fille* multiple times in the template.

Other variables, such as *muscle_bin* and *output_dir* are set outside
the template.  *muscle_bin* is a binary search path set by the outside
environment.  *output_dir* is a typical CoC value set by bio-pipeline
itself. These variables are treated in the following sections.

## bio-pipeline settings (CoC)

The predefined (default) bio-pileline paths are relative only, apart
from a few exceptions, such as the binary search path, the temp dir,
which is taken from the TMPDIR environment, unless overridden in
PIPELINE_TMP_DIR, or the configuration. Another absolute path is the
pipe line base dir, which is taken from the PIPELINE_EXPORT_DIR
environment setting. This can be a shared, exported, network drive.

The bio-pipeline settings are taken from
bio-pipeline/etc/bio-pipeline-config.yaml by default. You can override
the global settings configuration by passing a global config file into
the runner (this is not recommended).

Relative paths are also defined in the global settings configuration.

Most relative paths will be relative to the PIPELINE_EXPORT_DIR, or
*pipeline_dir*. For
example the common storage will be in *pipeline_dir*/store/.
Tasks will be running in *pipeline_dir*/runs/.

Some relative paths are relative to the run directory of a task.
For example, *output_dir*, which stores the results of a task.
This *output_dir* is tar balled at the end of a task run and put in
the *store_dir*.

This may all be a bit overwhelming, and while we stick to CoC, we do
allow overriding defaults at several levels.

(more soon)

## Binary search path

Inside a task, a name is first checked whether it exists as a method
in the Ruby bio-pipeline name space. If so, that is executed as a Ruby
method(!)

The store can carry its own binaries - which are the first to be used
- in *store_dir*/opt/packagename/bin/.

If this fails, [Nix packages](http://nixos.org/) are queried in the
/nix/ directory (Nix is a distribution agnostic packager for Linux and
OSX).

If this fails, Ruby gems are queried.

If this fails, binaries are searched in /opt/packagename/bin/

Finally the normal search path is used, i.e. /usr/local/bin, /usr/bin,
/bin.

In other words, the pipeline expects software to exist in the
*store_dir*. If not, Nix is checked, otherwise the local machine is
checked.

(more soon)





