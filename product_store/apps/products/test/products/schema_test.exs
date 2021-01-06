defmodule Products.SchemaTest do
  use Products.DataCase

  alias Products.Schema

  describe "categories" do
    alias Products.Schema.Category

    @valid_attrs %{code: "some code", description: "some description", name: "some name"}
    @update_attrs %{
      code: "some updated code",
      description: "some updated description",
      name: "some updated name"
    }
    @invalid_attrs %{code: nil, description: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Schema.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Schema.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Schema.create_category(@valid_attrs)
      assert category.code == "some code"
      assert category.description == "some description"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Schema.update_category(category, @update_attrs)
      assert category.code == "some updated code"
      assert category.description == "some updated description"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_category(category, @invalid_attrs)
      assert category == Schema.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Schema.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Schema.change_category(category)
    end
  end

  describe "aisles" do
    alias Products.Schema.Aisle

    @valid_attrs %{capacity: 42, number: 42, type: "some type"}
    @update_attrs %{capacity: 43, number: 43, type: "some updated type"}
    @invalid_attrs %{capacity: nil, number: nil, type: nil}

    def aisle_fixture(attrs \\ %{}) do
      {:ok, aisle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_aisle()

      aisle
    end

    test "list_aisles/0 returns all aisles" do
      aisle = aisle_fixture()
      assert Schema.list_aisles() == [aisle]
    end

    test "get_aisle!/1 returns the aisle with given id" do
      aisle = aisle_fixture()
      assert Schema.get_aisle!(aisle.id) == aisle
    end

    test "create_aisle/1 with valid data creates a aisle" do
      assert {:ok, %Aisle{} = aisle} = Schema.create_aisle(@valid_attrs)
      assert aisle.capacity == 42
      assert aisle.number == 42
      assert aisle.type == "some type"
    end

    test "create_aisle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_aisle(@invalid_attrs)
    end

    test "update_aisle/2 with valid data updates the aisle" do
      aisle = aisle_fixture()
      assert {:ok, %Aisle{} = aisle} = Schema.update_aisle(aisle, @update_attrs)
      assert aisle.capacity == 43
      assert aisle.number == 43
      assert aisle.type == "some updated type"
    end

    test "update_aisle/2 with invalid data returns error changeset" do
      aisle = aisle_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_aisle(aisle, @invalid_attrs)
      assert aisle == Schema.get_aisle!(aisle.id)
    end

    test "delete_aisle/1 deletes the aisle" do
      aisle = aisle_fixture()
      assert {:ok, %Aisle{}} = Schema.delete_aisle(aisle)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_aisle!(aisle.id) end
    end

    test "change_aisle/1 returns a aisle changeset" do
      aisle = aisle_fixture()
      assert %Ecto.Changeset{} = Schema.change_aisle(aisle)
    end
  end

  describe "products" do
    alias Products.Schema.Product

    @valid_attrs %{
      brand: "some brand",
      description: "some description",
      name: "some name",
      size: 42
    }
    @update_attrs %{
      brand: "some updated brand",
      description: "some updated description",
      name: "some updated name",
      size: 43
    }
    @invalid_attrs %{brand: nil, description: nil, name: nil, size: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Schema.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Schema.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Schema.create_product(@valid_attrs)
      assert product.brand == "some brand"
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.size == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Schema.update_product(product, @update_attrs)
      assert product.brand == "some updated brand"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.size == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_product(product, @invalid_attrs)
      assert product == Schema.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Schema.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Schema.change_product(product)
    end
  end
end
