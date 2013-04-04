class HelloController < Muggle::Controller
  def show
    @name = params["name"]
    render_with_layout "app/views/hello/show.html.haml", "app/layouts/application.html.haml" ,name: @name
  end
end
