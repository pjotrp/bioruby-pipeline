
require 'bio-pipeline'

Given /^an example YAML job command$/ do |string|
  @template = string
end

When /^I execute the YAML job$/ do
end

Then /^it sets the input to$/ do |string|
  @yamljob = BioPipeline::YamlJob.new(@template)
  yaml = @yamljob.parse_erb(nil,:output_dir => 'output')
  yaml.should == string
  job = YAML::load(yaml)
  job.should == {:commands=>["cat LICENSE.txt > output/aa.fa"]}
end

Then /^it creates the output dir$/ do
  @yamljob.run(:output_dir => 'output')
  File.directory?("output").should be_true
end

Then /^it prints the file to the output dir$/ do
  File.exist?("output/aa.fa").should be_true
end




