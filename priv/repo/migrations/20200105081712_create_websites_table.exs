defmodule RbApp.Repo.Migrations.CreateWebsitesTable do
  use Ecto.Migration

  def change do
      create table(:websites) do
        add(:website_id, :string)
        add(:name, :string)
        add(:description, :string)
        add(:url, :string)
        add(:category, :string)
        add(:language, :string)
        add(:country, :string)
    
  
        timestamps()
      end

      create unique_index(:websites, [:website_id])

    end
  
end
