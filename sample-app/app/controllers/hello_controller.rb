class HelloController < Hogger::Controller
  def show
    @name = params["name"]
    render "app/views/hello/show.html.haml", :name => @name
  end
end
