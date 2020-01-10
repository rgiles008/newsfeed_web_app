defmodule RbApp.ApiClient do
    # alias RbApp.{Article, Source} # use if not using a db
    alias RbApp.Article
    

    @doc """
    Sends an HTTP GET request to `NewsApi` and
    receives News Source Website json data.
    """
    def get(url, headers \\ [], struct_type) do
            url
            |> HTTPoison.get(headers) # HTTP request using HTTPoison dependency
            |> case do
                {:ok, %{body: raw, status_code: code}} -> {code, raw} # if request successful, get status and json body.
                {:error, %{reason: reason}} -> {:error, reason} # if request unsuccesful, get error and reason for error.
               end
            |> (fn {ok, body} -> # if successful,
                case struct_type do # determine struct type from params
                    "sources" -> # if params = "sources", then parse json body.
                        body
                        |> Poison.decode()
                        # |> Poison.decode(as: %{"sources" => [%Source{}]}) # use if not using database
                        |> case do
                            {:ok, parsed} -> {ok, parsed}
                                _-> {:error, body}
                            end
                    "articles" -> # if params = "articles", then parse json body and create Article struct using params from json body.
                        body
                        |> Poison.decode(as: %{"articles" => [%Article{}]})
                        |> case do
                            {:ok, parsed} -> {ok, parsed}
                                _-> {:error, body}
                            end
                
                end
                  
                end).()
                |> elem(1) # Grab second element in list, in this case, the list of Article structs or News Source maps.
                |> Map.get(struct_type) # Grab list using map key. Ex. articles: [%Article{}, %Article{},...] or "sources:" => [%{"website_id" => "value", "name", "value",...}]
    end


end