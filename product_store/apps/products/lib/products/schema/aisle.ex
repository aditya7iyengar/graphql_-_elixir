defmodule Products.Schema.Aisle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aisles" do
    field :capacity, :integer
    field :number, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(aisle, attrs) do
    aisle
    |> cast(attrs, [:number, :type, :capacity])
    |> validate_required([:number, :type, :capacity])
  end
end
