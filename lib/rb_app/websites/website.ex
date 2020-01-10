defmodule RbApp.Website do
  use RbApp.Model, :model

  import Ecto.Query, warn: false


  @moduledoc """
  Context for website data
  """

  @fields [
    :website_id,
    :name,
    :description,
    :url,
    :category,
    :language,
    :country
  ]

  @required [
    :website_id,
    :name,
    :url,
    :country
  ]

  @derive {
    Jason.Encoder,

      only: [
        :id,
        :website_id,
        :name,
        :description,
        :url,
        :category,
        :language,
        :country
        ]
      }

  schema "websites" do
    field(:website_id, :string)
    field(:name, :string)
    field(:description, :string)
    field(:url, :string)
    field(:category, :string)
    field(:language, :string)
    field(:country, :string)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required)
  end





  # -------------------------------------------------------------------

  # Use for filter feature for future project.

  # defp filter_config(:websites) do
  #   defconfig do
  #       text :language
        
  #        #TODO add config for creditLimit of type decimal
  #   end
  # end


  # Use for filter feature for future project.

  # def filter_websites(website_filter) do
  #   case Filtrex.parse_params(filter_config(:websites), website_filter) do
  #     {:ok, filter} ->
  #     IO.inspect(filter)
  #     IO.inspect(website_filter)
  #     Website |> Filtrex.query(filter) |> Repo.all()
  #     {:error, _error} -> []
  #   end
  # end

end
