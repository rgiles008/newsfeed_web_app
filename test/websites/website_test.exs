defmodule RbApp.WebsiteTest do
  @moduledoc """
  Test for using the website context
  """

  import RbApp.Factory
  use RbApp.DataCase
  alias RbApp.Website

  describe "changesets" do
    test "should return valid changeset with valid attrs" do
      valid_attrs = %{
        website_id: "some-name",
        name: "some-text",
        description: "description",
        url: "https://www.website.com",
        category: "category",
        language: "en",
        country: "us"
      }

      changeset = %Website{} |> Website.changeset(valid_attrs)
      assert changeset.valid?
    end

    test "should return error with invalid attrs" do
      invalid_attrs = %{}
      changeset = %Website{} |> Website.changeset(invalid_attrs)
      refute changeset.valid?

      required_keys = [
        :website_id,
        :name,
        :url,
        :country
      ]

      has_all =
        Enum.all?(changeset.errors, fn err ->
          Enum.member?(required_keys, elem(err, 0))
        end)

      assert has_all
    end
  end
end
