require 'spec_helper'

describe Render::Engine do
  describe ".engine" do
    it "sets @engine" do
      engine = mock
      Render::Engine.engine = engine
      Render::Engine.engine.should be engine
    end
  end
end
