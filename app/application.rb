class Application
    @@items=[]
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match?(/items/)
            found = @@items.find {|item| item.name.match(req.path.split('/').last)}
            if found
                resp.status = 200                
                resp.write found.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end 