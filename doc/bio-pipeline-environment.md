# bio-pipeline settings, variables and environment

bio-pipeline addresses do-not-repeat-yoursefl (DRY) principles for
creating tasks at the job level, and aims for
convention-over-configuration (CoC). 

In this document we describe the environment that bio-pipeline
operates in. The environment potentially has to be passed into a
job-scheduler which puts constraints on a job. For example, the
environment PATH may not be set, or complete, when running on a
different machine in a cluster.

## Jobs

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
inside the template. Other variables, such as *muscle_bin* and
*output_dir* are set outside the template.




