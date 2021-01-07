defmodule Products.Schema do
  @moduledoc """
  The Schema context.
  """

  import Ecto.Query, warn: false
  alias Products.Repo

  alias Products.Schema.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Products.Schema.Aisle

  @doc """
  Returns the list of aisles.

  ## Examples

      iex> list_aisles()
      [%Aisle{}, ...]

  """
  def list_aisles do
    Repo.all(Aisle)
  end

  @doc """
  Returns the list of aisles.

  ## Examples

      iex> list_aisles()
      [%Aisle{}, ...]

  """
  def list_aisles(args) do
    num = Map.fetch!(args, :first)
    min_capacity = Map.get(args, :min_capacity, 0)
    storage_type = Map.get(args, :storage_type, nil)

    query =
      case storage_type do
        nil ->
          where(Aisle, [a], a.capacity >= ^min_capacity)

        other ->
          where(Aisle, [a], a.capacity >= ^min_capacity and a.type == ^other)
      end

    query
    |> limit(^num)
    |> Repo.all()
  end

  @doc """
  Gets a single aisle.

  Raises `Ecto.NoResultsError` if the Aisle does not exist.

  ## Examples

      iex> get_aisle!(123)
      %Aisle{}

      iex> get_aisle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aisle!(id), do: Repo.get!(Aisle, id)

  @doc """
  Creates a aisle.

  ## Examples

      iex> create_aisle(%{field: value})
      {:ok, %Aisle{}}

      iex> create_aisle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aisle(attrs \\ %{}) do
    %Aisle{}
    |> Aisle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aisle.

  ## Examples

      iex> update_aisle(aisle, %{field: new_value})
      {:ok, %Aisle{}}

      iex> update_aisle(aisle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aisle(%Aisle{} = aisle, attrs) do
    aisle
    |> Aisle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a aisle.

  ## Examples

      iex> delete_aisle(aisle)
      {:ok, %Aisle{}}

      iex> delete_aisle(aisle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aisle(%Aisle{} = aisle) do
    Repo.delete(aisle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aisle changes.

  ## Examples

      iex> change_aisle(aisle)
      %Ecto.Changeset{data: %Aisle{}}

  """
  def change_aisle(%Aisle{} = aisle, attrs \\ %{}) do
    Aisle.changeset(aisle, attrs)
  end

  alias Products.Schema.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  def aisle_for_product(storage_type, size) do
    query =
      Aisle
      |> where([a], a.capacity >= ^size and a.type == ^storage_type)
      |> join(:inner, [a], p in Product, on: a.id == p.aisle_id)
      |> limit(1)
      |> select([a, p], {a.number, p.name})

    Repo.one(query)
  end
end
