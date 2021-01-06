defmodule Products.Schema.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :code, :string
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :code, :description])
    |> validate_required([:name, :code, :description])
  end
end
