class Application
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split(/items\//).last
            item = Item.all.find{|item| item.name == item_name}
            resp.write handle_item(item)
            resp.status = handle_item_status(item)
        else
            resp.status = 404
            resp.write "Route not found"
        end

        resp.finish
    end

    def handle_item_status(item)
        if item
            return 200
        else
            return 400
        end
    end


    def handle_item(item)
        if item 
            return "#{item.price}"
        else
            return "Item not found"
        end
    end
end