class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)

      item_name = req.path.split("/item/").last
      if item = @@item.find{|i| i.name == item_name}
        resp.write item.price
    else
      resp.status = 404
      resp.write "Item not found"
    end
  else
    resp.status = 404
    resp.write "Route not found"
  end
    resp.finish
  end
end
