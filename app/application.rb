class Application
    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/").last
            resp.write(handle_lookup(resp, item))
        else 
            resp.write("Route not found")
            resp.status = 404
        end
        resp.finish
    end

    def handle_lookup(resp, item_name)
        search = @@items.find{|item| item.name == item_name}
        if !search
            resp.write("Item not found")
            resp.status = 400
        else 
            resp.write(search.price)
        end
    end
end