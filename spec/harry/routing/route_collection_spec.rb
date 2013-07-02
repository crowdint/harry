require "spec_helper"

describe Harry::Routing::RouteCollection do
  let(:controller_class) do
    Class.new
  end

  let(:route) do
    Harry::Routing::Route.new "/hello", controller: controller_class, action: :new
  end

  before do
    subject.routes << route
  end

  describe "#match" do
    it "creates a Route with specified options" do
      mocked_route = mock
      Harry::Routing::Route.should_receive(:new).
          with("/new_path", controller: controller_class, action: :create).
          and_return mocked_route
      subject.match("/new_path", controller: controller_class, action: :create)
      subject.routes.should include(mocked_route)
    end
  end

  describe "#dispatch" do
    context "A Route that exists" do
      it "calls the specified action on the Route controller class" do
        controller = mock
        controller_class.should_receive(:new).and_return controller
        controller.should_receive(:new).and_return("HTML CONTENT")
        subject.dispatch({ "REQUEST_PATH" => "/hello"}).should eq "HTML CONTENT"
      end
    end

    context "A route that does not exist" do
      it "raises a Harry::RouteNotFoundException" do
        expect {
          subject.dispatch("/unknown")
        }.to raise_error Harry::Routing::RouteNotFoundException
      end
    end
  end
end
