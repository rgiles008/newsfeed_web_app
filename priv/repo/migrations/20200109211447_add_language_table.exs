defmodule RbApp.Repo.Migrations.AddLanguageTable do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add(:language, :string)
    end

    create unique_index(:languages, [:language])

  end
end
