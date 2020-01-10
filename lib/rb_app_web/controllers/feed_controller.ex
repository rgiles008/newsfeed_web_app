defmodule RbAppWeb.FeedController do
    use RbAppWeb, :controller

    alias RbApp.{ApiCalls, Websites}



    def index(conn, _params) do

        # Grabs List of News Source Website structs.
        sources = ApiCalls.get_website_sources()

        # Sends list of News Source Website structs to Websites Module to update websites table in the db.
        Websites.create_website(sources)

        # Grabs list of News Source Website structs from the websites table in the db.
        database_sources = Websites.list_news_sources()

        # Routes to index.html on /feed and sends the list of News Source Website structs as params.
        render(conn, "index.html", sources: database_sources )


        # database_languages = Websites.list_languages() # use for filter feature in the future project.
        # render(conn, "index.html", sources: database_sources, languages: database_languages ) # use for filter feature in the future project.

    end

    def show(conn, site) do

        # Grabs News Source Website struct from the db where id = id param, assigns struct to `db-source`
        db_source = Websites.get_site(%{"id" => Map.get(site, "id")}) 

        # Grabs List of News Source Article structs where News Source website_id = website_id param.
        headlines = ApiCalls.get_top_headlines(db_source.website_id)
                
        # Routes to headlines.html on /feed/website_id and sends the list of Article structs as params.
        render(conn, "headlines.html", headlines: headlines)
           
    end

end

