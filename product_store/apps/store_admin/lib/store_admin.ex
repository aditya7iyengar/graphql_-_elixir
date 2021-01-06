defmodule StoreAdmin do
  @moduledoc """
  Admin app for Store management
  """

  import Ecto.Query

  alias Products.Schema.{Aisle, Category, Product}

  alias Products.Repo

  def aisle_for_product(storage_type, size, category_name) do
    result =
      "PRODUCT_INTERFACE"
      |> System.get_env("elixir")
      |> _aisle_for_product(storage_type, size, category_name)

    case result do
      nil ->
        "No aisle available to place the product"

      {aisle_number, neighbor_name} ->
        "Place the product on aisle #{aisle_number} next to #{neighbor_name}"
    end
  end

  defp _aisle_for_product(interface, storage_type, size, category_name)

  defp _aisle_for_product("elixir", storage_type, size, category_name) do
    query =
      Aisle
      |> where([a], a.capacity >= ^size)
      |> where([a], a.type == ^storage_type)
      |> join(:inner, [a], p in Product, on: a.id == p.aisle_id)
      |> join(:inner, [_a, p], c in Category, on: c.id == p.category_id)
      |> where([_a, _p, c], c.name == ^category_name)
      |> limit(1)
      |> select([a, p], {a.number, p.name})

    Repo.one(query)
  end

  defp _aisle_for_product("graphql", storage_type, size, category_name) do
  end

  defp _aisle_for_product("bad-rest", storage_type, size, category_name) do
  end

  defp _aisle_for_product("good-rest", storage_type, size, category_name) do
  end
end
