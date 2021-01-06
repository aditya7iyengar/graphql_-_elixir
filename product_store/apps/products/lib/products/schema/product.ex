defmodule Products.Schema.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :brand, :string
    field :description, :string
    field :name, :string
    field :size, :integer
    field :category_id, :id
    field :aisle_id, :id
    field :storage_type, :string, default: "warm"

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :brand, :size, :storage_type])
    |> validate_required([:name, :description, :brand, :size, :storage_type])
  end
end
