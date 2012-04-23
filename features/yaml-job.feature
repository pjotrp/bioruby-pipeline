Feature: Run a job or task described with YAML and ERB
  In order to describe a job that can be run in a pipeline,
  we introduce a data structure in YAML, which acts also
  as a template preparsed by erb. An example would be

    :inputs:
      :seq_file: <%= in_file = 'aa.fa' %>
    :commands:
      - <%= muscle_bin %> -i <%= seq_file %> -o <%= outputdir %>/aa-align.fa
    :outputs:
      - <%= outputdir %>/*

  Scenario: Execute a simple job in the shell
    Given an example YAML job command
    """
:seq_file: <%= in_file='test/data/nt.fa' %>
:commands:
  - "cat <%= in_file %> > <%= output_dir %>/nt.fa"
    """
    When I execute the YAML job
    Then it sets the input to
    """
:seq_file: test/data/nt.fa
:commands:
  - "cat test/data/nt.fa > output/nt.fa"
    """
    And it creates the output dir
    And it prints the file to the output dir


