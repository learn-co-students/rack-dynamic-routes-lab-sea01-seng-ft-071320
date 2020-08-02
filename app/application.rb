class Application 

    @@items= [Item.new("Apples", 2), 
    Item.new("Carrots", 3), 
    Item.new("Pears", 5)]
    
    def call (env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match (/items/)
            item = req.path.split("/items/").last
            if item_name = @@items.find {|i| i.name == item}
                resp.write item_name.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end