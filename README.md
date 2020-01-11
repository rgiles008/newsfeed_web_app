# News Feed Web Application

An event microservice that interacts with NEWS API to process data and display them using Elixir/Phoenix.


                                    #>---------------------------------------<# 
                                                   App Flow 
                                    #>---------------------------------------<#
This web application starts in the [Router](lib/rb_app_web/router.ex) file

   --Route `get "/", PageController, :index`, root route, goes to [page_controller](lib/rb_app_web/controllers/page_controller.ex) file and executes the `index()` function.

        --In the index function of `page_controller.ex` file, it passes a `connection` and renders `index.html` in the browser.

            --`index.html` renders a simple webpage with three nav links (`HOME`, `FEED`, `ABOUT`) and a jumbtron that renders some text and a button that redirects you to the `/feed` page.

   -- Route `resources "/feed", FeedController, only: [:index, :show]`, the `FEED Nav Link` and the `Go to News Feed button`, flows to [feed_controller](lib/rb_app_web/controllers/feed_controller.ex) file and executes the `index` function.

        --In the index function of `feed_controller.ex` file,
            * a 'connection` is passed to it,
            * function `get_website_sources` from `ApiCalls` module is called and returns a `list of            %Website{} structs`,
            * the `list of %Website{} structs` is sent as a parameter to the function `create_website`          from `Websites` module to update_or_insert records into the db,
            * the function `list_news_sources` from `Websites` module is called and returns a `list of          %Website{} structs` from the db,
            * and then the `connection`, `list of %Website{} structs` from the db, and `index.html` is          passed to the `render` function.
            * `index.html` in `Feed` folder is rendered in the browser.
                --`index.html` in the `Feed` folder renders a webpage with a table that lists all news          outlets from the db with a button `Top Headlines` that routes to 
                      `/feed/:website_id`

   -- Route `resources "/feed/:website_id", FeedController, only: [:index, :show]` flows to feed_controller.ex file and executes the `show` function. The `FEED Nav Link` and the `Back to Sources button`, flows to feed_controller.ex file and executes the `index` function.

        --In the show function of `feed_controller.ex` file,
            * a `connection` is passed to it,
            * function `get_site` from `Websites` module is called and returns a `%Website{} struct` from       the db, where `website_id` = id param passed to the function,
            * the function `get_top_headlines` from `ApiCalls` module is called and returns a `list of          %Article{} structs`, where `website_id` = website_id param passed to the function,
            * and then the `connection`, `list of %Article{} structs`, and `headlines.html` is passed to        the `render` function.
            * `headlines.html` in `Feed` folder is rendered in the browser.
                --`headlines.html` in the `Feed` folder renders a webpage with a table that lists Top           Articles from the News Outlet selected with a button `Read Article` that routes to        the URL of the specific article chosen.

   -- Route `resources "/about", AboutController` flows to [about_controller](lib/rb_app_web/controllers/about_controller.ex) file and executes the  `index` function. 

        --In the index function of `about_controller.ex` file,
            * a `connection` is passed to it,
            * and then the `connection` and `about.html` is passed to the `render` function.
            * `about.html` in `About` folder is rendered in the browser.
                --`about.html` in the `About` folder renders a simple webpage with three nav links              (`HOME`, `FEED`, `ABOUT`) and a jumbtron that renders some text about the web app.

### Test

Run `mix test`


