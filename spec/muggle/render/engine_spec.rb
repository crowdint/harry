require 'spec_helper'

describe Render::Engine do
  describe ".engine" do
    it "sets @engine" do
      engine = mock
      Render::Engine.engine = engine
      Render::Engine.engine.should be engine
    end
  end

  describe "#read_template" do
    it "returns the contents of the specified template file" do
      file          = mock
      template_path = "TEMPLATE PATH"
      file_content  = "FILE CONTENT"

      File.should_receive(:new).with(template_path).and_return(file)
      file.should_receive(:read).and_return file_content

      engine = Render::Engine.new(template_path)
      engine.read_template
    end
  end
end
