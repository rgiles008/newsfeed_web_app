defmodule RbApp.ApiCalls do
    @moduledoc """
        Api endpoints to use for News Api
    """
    alias RbApp.{ApiClient}

    @doc """
    Sends HTTP url, Api header, and data type to ApiClient.
    """
    def get_website_sources() do
        ApiClient.get("https://newsapi.org/v2/sources", [{"X-Api-Key", "725f7a56a91b4f3dabe15b42a64dc84c"}], "sources")
    end

    @doc """
    Sends HTTP url, Api header, and data type to ApiClient.
    """
    def get_top_headlines(id) do
        ApiClient.get("https://newsapi.org/v2/top-headlines?sources=#{id}", [{"X-Api-Key", "725f7a56a91b4f3dabe15b42a64dc84c"}], "articles")
    end
end