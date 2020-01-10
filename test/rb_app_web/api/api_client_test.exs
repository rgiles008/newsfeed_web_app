defmodule RbAppWeb.ApiClientTest do

use ExUnit.Case
use Plug.Test
alias RbApp.ApiClient

    describe "Gets a list of News data" do

        test "Gets a list of News Sources and the first element should match a map `%{}` and `id` key/value pair should not be nil." do

            [head | _tail] = ApiClient.get("https://newsapi.org/v2/sources", [{"X-Api-Key", "725f7a56a91b4f3dabe15b42a64dc84c"}], "sources")

            assert %{} = head
            refute Map.get(head, "id") == nil
        end


        test "Gets a list of News Articles and the first element should match a `%Article{}` struct and the `id` key:value pair should not be nil." do

            [head | _tail] = ApiClient.get("https://newsapi.org/v2/top-headlines?sources=abc-news", [{"X-Api-Key", "725f7a56a91b4f3dabe15b42a64dc84c"}], "articles")
    
            assert %RbApp.Article{} = head
            refute head.id == nil
        end


    end





end