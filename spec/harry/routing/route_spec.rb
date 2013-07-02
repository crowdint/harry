require "spec_helper"

describe Harry::Routing::Route do
  let(:controller_class) do
    Class.new
  end

  subject do
    Harry::Routing::Route.new "/home", controller: controller_class, action: :new
  end

  describe :initialize do
    specify { subject.path.should eq "/home" }
    specify { subject.controller.should be controller_class }
    specify { subject.action.should be :new }
  end

  describe :matches? do
    specify { subject.matches?("/home").should be_true }
    specify { subject.matches?("/homer").should be_false }
  end
end
