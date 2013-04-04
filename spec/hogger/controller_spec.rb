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

  describe "#render" do
    it "reads the template and parses it with HAML" do
      subject.should_receive(:read_template).with("test.html.haml").
          and_return "%html\n  %title=foo"
      subject.render("test.html.haml", { "foo" => "bar" }).
          should eq "<html>\n  <title>bar</title>\n</html>\n"
    end
  end

  describe "#render_with_layout" do
    it "renders the template within a layout" do
      subject.should_receive(:read_layout).with("layout.html.haml").
          and_return "%html\n  %body= yield"
      subject.should_receive(:read_template).with("test.html.haml").
          and_return "#test content"

      subject.render_with_layout("test.html.haml", "layout.html.haml").
          should eq  "<html>\n  <body><div id='test'>content</div></body>\n</html>\n"
    end
  end
end
