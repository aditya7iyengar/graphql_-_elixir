defmodule ProductsQL.Schema.Products do
  @moduledoc """
  GrapqhQL queries and objects for Products context
  """

  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias ProductsQL.Resolvers
  alias ProductsQL.Dataloaders.Repo

  object :queries do
    @desc "List Aisles"
    field :aisles, list_of(:aisle) do
      arg(:first, non_null(:integer))
      arg(:min_capacity, :integer)
      arg(:storage_type, :string)

      resolve(&Resolvers.Products.list_aisles/3)
    end
  end

  object :aisle do
    field :id, :string
    field :capacity, :integer
    field :number, :integer
    field :type, :string

    field :products, list_of(:product), resolve: dataloader(Repo)
  end

  object :product do
    field :id, :string
    field :name, :string
    field :brand, :string
    field :description, :string

    field :category, :category, resolve: dataloader(Repo)
  end

  object :category do
    field :id, :string
    field :name, :string
    field :code, :string
    field :description, :string
  end
end
