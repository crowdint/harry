require 'spec_helper'

describe Harry::Render::Engine do
  describe "#read_template_with_path" do
    it "returns the contents of the specified template file" do
      file          = mock
      template_path = "TEMPLATE_PATH"
      file_content  = "FILE_CONTENT"

      File.should_receive(:new).with(template_path).and_return(file)
      file.should_receive(:read).and_return file_content

      engine = Harry::Render::Engine.new(template_path)
      engine.read_template_with_path(template_path)
    end
  end

  describe "#read_template" do
    it "reads the default template specified on init" do
      template_path = "TEMPLATE_PATH"
      content       = mock
      engine        = Harry::Render::Engine.new(template_path)

      engine.should_receive(:read_template_with_path).with(template_path).and_return(content)
      engine.read_template.should be content
    end
  end
end
