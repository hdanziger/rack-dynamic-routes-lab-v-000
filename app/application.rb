class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/item"
      resp.write "You requested #{item}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end