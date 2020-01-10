defmodule RbApp.Factory do
  @moduledoc """
  Factory for building geniricized test structures
  """

  use ExMachina.Ecto, repo: RbApp.Repo

  # def website_factory do
  #   %RbApp.Website{
  #     url: "https://www.website.com",
  #     website_title: "test site",
  #     api_key: "some_key"
  #   }
  # end
end