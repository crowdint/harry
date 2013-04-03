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
end
