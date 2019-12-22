defmodule RbAppWeb.PageController do
  use RbAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
