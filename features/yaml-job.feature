Feature: Run a job or task described with YAML and ERB
  In order to describe a job that can be run in a pipeline,
  we introduce a data structure in YAML, which acts also
  as a template preparsed by erb. An example would be

    :inputs:
      :seq_file: aa.fa
    :commands:
      - <%= muscle_bin %> -i <%= seq_file %> -o <%= outputdir %>/aa-align.fa
    :outputs:
      - <%= outputdir %>/*

  Scenario: Execute a simple job in the shell
    Given an example YAML job command
    """
# <%= in_file='LICENSE.txt' %>
:commands:
  - "cat <%= in_file %> > <%= output_dir %>/aa.fa"
    """
    When I execute the YAML job
    Then it sets the input to
    """
# LICENSE.txt
:commands:
  - "cat LICENSE.txt > output/aa.fa"
    """
    And it creates the output dir
    And it prints the file to the output dir


