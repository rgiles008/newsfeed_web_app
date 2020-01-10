defmodule RbAppWeb.PageControllerTest do
  use RbAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to the Global News Feed!"
  end
end
