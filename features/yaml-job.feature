Feature: Run a job or task described with YAML and ERB
  In order to describe a job that can be run in a pipeline,
  we introduce a data structure in YAML, which acts also
  as a template preparsed by erb. An example for running an alignment
  program would be

    :inputs:
      - <%= in_file = 'aa.fa' %>      # here we set in_file too!
    :commands:
      - <%= muscle_bin %> -i <%= in_file %> -o <%= output_dir %>/aa-align.fa
    :outputs:
      - <%= output_dir %>/*

  Note that in_file gets defined in the YAML file, while muscle_bin and output_dir 
  are defined by the calling context.

  Scenario: Execute a simple job in the shell
    Given an example YAML job command
    """
:inputs:
  - <%= in_file='test/data/nt.fa' %>
:commands:
  - "cat <%= in_file %> > <%= output_dir %>/nt.fa"
    """
    When I execute the YAML job
    Then it sets the input to
    """
:inputs:
  - test/data/nt.fa
:commands:
  - "cat test/data/nt.fa > output/nt.fa"
    """
    And it creates the output dir
    And it prints the file to the output dir


