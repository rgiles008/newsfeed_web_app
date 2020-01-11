defmodule RbAppWeb.FeedControllerTest do
    use RbAppWeb.ConnCase
    use ExUnit.Case

    test "GET /", %{conn: conn} do
        conn = get conn, "/"
        assert html_response(conn, 200) =~ "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n" <>
        "    <meta charset=\"utf-8\"/>\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n" <>
        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, minimum-scale=1.0," <>
        " maximum-scale=1.0, shrink-to-fit=no, user-scalable=no\"/>\n    <title>RbApp · Phoenix Framework</title>\n" <>
        "    <link rel=\"stylesheet\" href=\"/css/app.css\"/>\n  </head>\n  <body>\n    <header>\n      <section>\n" <>
        "        <nav role=\"navigation\" class=\"row\" >\n          <ul>\n            <li>\n              <a href=\"/\"" <>
        " class=\"phx-logo\">\n                <img src=\"/images/News_Logo_Small.png\" alt=\"Global News Feed Logo\"/>\n" <>
        "              </a>\n            </li>\n            <li><a href=\"/\">HOME</a></li>\n            \n            <li>" <>
        "<a href=\"/feed\">FEED</a></li>\n            \n            <li><a href=\"/about\">ABOUT</a></li>\n            \n" <>
        "          </ul>\n        </nav>\n        <section class=\"row\">\n        \n        </section>\n      </section>\n" <>
        "    </header>\n    <main role=\"main\" class=\"container\">\n      <p class=\"alert alert-info\" role=\"alert\"></p>\n" <>
        "      <p class=\"alert alert-danger\" role=\"alert\"></p>\n<section class=\"phx-hero\">\n" <>
        "  <h2>Welcome to the Global News Feed!</h2>\n<a class=\"button\" href=\"/feed\">" <>
        "Go to News Feed</a>   \n</section>\n\n    </main>\n    <script type=\"text/javascript\" src=\"/js/app.js\"></script>\n  </body>\n</html>\n"
      end
end
