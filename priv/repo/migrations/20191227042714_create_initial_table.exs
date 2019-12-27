defmodule RbApp.Repo.Migrations.CreateInitialTable do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add(:url, :string)
      add(:website_title, :string)
      add(:api_key, :string)

      timestamps()
    end
  end
end
