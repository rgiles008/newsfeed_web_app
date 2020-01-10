defmodule RbApp.Article do
    @derive Phoenix.Param

    defstruct id: "", source: "", author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: ""
end