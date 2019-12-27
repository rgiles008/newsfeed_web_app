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
        url: "https://www.website.com",
        website_title: "test site",
        api_key: "some_key"
      }

      changeset = %Website{} |> Website.changeset(valid_attrs)
      assert changeset.valid?
    end

    test "should return error with invalid attrs" do
      invalid_attrs = %{}
      changeset = %Website{} |> Website.changeset(invalid_attrs)
      refute changeset.valid?

      required_keys = [
        :url,
        :website_title,
        :api_key
      ]

      has_all =
        Enum.all?(changeset.errors, fn err ->
          Enum.member?(required_keys, elem(err, 0))
        end)

      assert has_all
    end
  end
end
