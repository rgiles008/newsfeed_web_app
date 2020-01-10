defmodule RbAppWeb.AboutController do
    use RbAppWeb, :controller

    def index(conn, _params) do
        render( conn, "about.html")
      end
    
end