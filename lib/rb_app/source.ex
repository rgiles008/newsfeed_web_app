defmodule RbApp.Source do
    @derive Phoenix.Param

    defstruct id: "", name: "", description: "", url: "", category: "", language: "", country: ""
end