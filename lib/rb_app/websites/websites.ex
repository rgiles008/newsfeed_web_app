defmodule RbApp.Websites do
  alias RbApp.{Repo, Website}

  import Ecto.Query, warn: false

  @doc """
  Returns a list of websites.

  ## Examples

      iex> list_news_sources()
      [%Website{}, ...]

  """
  def list_news_sources do
    Repo.all(Website)
  end

  @doc """
  Accepts a list of News Source maps,
  loops through each one,
  creates new maps that include the `website_id` key:value pair,
  build website struct with data,
  and finally, either inserts into db or updates existing record.

  """
  def create_website(attrs \\ %{}) do
    # Loop through list of News Source Maps
    Enum.each(attrs, fn x ->
      # Create new map with `website_id` key:value pair
      y = Map.put(x, "website_id", Map.get(x, "id"))

      # Insert/Update languages into db  # Use for filter feature in future project.
      # get_language_struct(y)
      # |> Language.changeset()
      # |> Repo.insert_or_update

      # Insert/Update News Sources into db
      get_website_struct(y)
      |> Website.changeset()
      |> Repo.insert_or_update()
    end)
  end

  @doc """
  Gets Website struct from db if it exists,
  if it doesn't exist in db, then it builds a Website struct using parameter y map.
  """
  def get_website_struct(y) do
    _result =
      case Repo.get_by(Website, website_id: Map.get(y, "website_id")) do
        nil ->
          %Website{
            website_id: Map.get(y, "website_id"),
            name: Map.get(y, "name"),
            description: Map.get(y, "description"),
            url: Map.get(y, "url"),
            category: Map.get(y, "category"),
            language: Map.get(y, "language"),
            country: Map.get(y, "country")
          }

        # Website not found, we build one

        # Website exists, let's use it
        website ->
          website
      end
  end

  @doc """
  Gets a single website.

  Raises `Ecto.NoResultsError` if the Website does not exist.

  ## Examples

    iex> get_website!(123)
    %Website{}

    iex> get_website!(456)
    ** (Ecto.NoResultsError)

  """

  def get_website(%{"website_id" => website_id} = _params) do
    Repo.get_by(Website, website_id: website_id)
  end

  def get_website(_), do: nil

  @doc """
  Gets a single website from db where `website_id` = id param.

  """
  def get_site(%{"id" => id} = _params) do
    q = from(w in Website, where: w.website_id == ^id)
    Repo.one(q)
    #  Repo.get_by(Website,%{"id" => id})
  end

  # --------------------------------------------------------------------------

  # Use for filter feature in future project

  # def get_language_struct(y) do
  #   _result =
  #       case Repo.get_by(Language, language: Map.get(y, "language")) do
  #         nil  -> %Language{
  #                              language: Map.get(y, "language")
  #                           } # Language not found, we build one

  #         language -> language          # Language exists, let's use it
  #         IO.inspect language
  #       end
  # end

  # Use for filter feature in future project

  # def list_languages do
  #   Repo.all(Language)
  # end
end
