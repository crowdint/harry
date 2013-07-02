class HelloController < Harry::Controller
  def show
    @name = params["name"]
    render_with_layout "app/views/hello/show.html.haml",
        layout: "app/layouts/application.html.haml", locals: { name: @name }
  end
end
