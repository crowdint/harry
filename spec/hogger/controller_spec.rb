require "spec_helper"

describe Hogger::Controller do
  let(:env) do
    { "QUERY_STRING"=>"name=john&last_name=doe" }
  end

  let(:subject) do
    Hogger::Controller.new env
  end

  describe "#initialize" do
    it "sets env" do
      subject.env.should be env
    end

    it "calls parse_parameters" do
      Hogger::Controller.any_instance.should_receive(:parse_parameters)
      subject
    end
  end

  describe "#parse_parameters" do
    it "sets the parameters as a hash on params" do
      subject.params.should eq({ "name" => "john", "last_name" => "doe" })
    end
  end

  describe "#read_template" do
    it "reads the specified file" do
      file = mock
      File.should_receive(:new).with("test.html.haml").and_return file
      file.should_receive(:read).and_return("TEMPLATE CONTENTS")
      subject.read_template("test.html.haml").should eq "TEMPLATE CONTENTS"
    end
  end

  describe "#render" do
    it "reads the template and parses it with HAML" do
      subject.should_receive(:read_template).with("test.html.haml").
          and_return "%html\n  %title=foo"
      subject.render("test.html.haml", { "foo" => "bar" }).
          should eq "<html>\n  <title>bar</title>\n</html>\n"
    end
  end
end
