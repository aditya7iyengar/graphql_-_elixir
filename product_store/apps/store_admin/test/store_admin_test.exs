defmodule StoreAdminTest do
  use ExUnit.Case
  doctest StoreAdmin

  alias Products.Schema.{Aisle, Category, Product}
  alias Products.Repo

  setup_all do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Products.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(Products.Repo, {:shared, self()})

    {:ok, icecream_category} =
      Repo.insert(%Category{
        code: "icecream",
        name: "icecream",
        description: "Ice Cream"
      })

    {:ok, dairy_category} =
      Repo.insert(%Category{
        code: "dairy",
        name: "dairy",
        description: "Ice Cream"
      })

    {:ok, icecream_aisle} =
      Repo.insert(%Aisle{
        number: 1,
        capacity: 100,
        type: "frozen"
      })

    {:ok, dairy_aisle} =
      Repo.insert(%Aisle{
        number: 2,
        capacity: 0,
        type: "cold"
      })

    {:ok, _icecream_product} =
      Repo.insert(%Product{
        storage_type: "frozen",
        name: "Vegan Chunky Monkey",
        brand: "Ben N Jerry's",
        description: "Delicious!!",
        size: 1,
        category_id: icecream_category.id,
        aisle_id: icecream_aisle.id
      })

    {:ok, _dairy_product} =
      Repo.insert(%Product{
        storage_type: "cold",
        name: "Almond Milk",
        brand: "Silk",
        description: "Delicious!!!!",
        size: 2,
        category_id: dairy_category.id,
        aisle_id: dairy_aisle.id
      })

    :ok
  end

  describe "aisle_for_product/2" do
    test "cannot find aisle if none available" do
      storage_type = "cold"
      size = 1

      result = StoreAdmin.aisle_for_product(storage_type, size)

      assert result == "No aisle available to place the product"
    end

    test "finds the first aisle available" do
      storage_type = "frozen"
      size = 1

      result = StoreAdmin.aisle_for_product(storage_type, size)

      assert result =~ "on aisle 1 next to Vegan Chunky Monkey"
    end
  end
end
