require "spec_helper"

describe Hogger::Route do
  let(:controller_class) do
    Class.new
  end

  subject do
    Hogger::Route.new "/home", controller: controller_class, action: :new
  end

  describe :initialize do
    specify { subject.uri.should eq "/home" }
    specify { subject.controller.should be controller_class }
    specify { subject.action.should be :new }
  end

  describe :matches? do
    specify { subject.matches?("/home").should be_true }
    specify { subject.matches?("/homer").should be_false }
  end
end
