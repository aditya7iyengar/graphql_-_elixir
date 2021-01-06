defmodule Products.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :brand, :string
      add :size, :integer
      add :storage_type, :string, default: "warm"
      add :category_id, references(:categories, on_delete: :nothing)
      add :aisle_id, references(:aisles, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:category_id])
    create index(:products, [:aisle_id])
  end
end
