defmodule RbApp.Website do
  use RbApp.Model, :model

  @moduledoc """
  Context for website data
  """

  @fields [
    :url,
    :website_title,
    :api_key
  ]

  @required [
    :api_key,
    :url
  ]

  schema "websites" do
    field(:url, :string)
    field(:website_title, :string)
    field(:api_key, :string)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required)
  end
end
