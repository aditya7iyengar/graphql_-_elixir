defmodule Products.Repo.Migrations.CreateAisles do
  use Ecto.Migration

  def change do
    create table(:aisles) do
      add :number, :integer
      add :type, :string
      add :capacity, :integer

      timestamps()
    end
  end
end
