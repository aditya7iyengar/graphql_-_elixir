defmodule StoreAdmin.GraphQL do
  @url "http://localhost:4000/graphql_api/"

  @query """
  query {
    products(first: 1, category_name: $category_name) {
      name
      aisles(first: 1, min_size: $size, type: $storage_type) {
        number
      }
    }
  }
  """

  def aisle_for_product(storage_type, size, category_name) do
    resp =
      HTTPoison.post(
        @url,
        %{
          query: @query,
          variables: %{
            storage_type: storage_type,
            size: size,
            category_name: category_name
          }
        }
      )

    case resp do
      {:ok, %HTTPoison.Response{body: "\"null\""}} ->
        nil

      {:ok, %HTTPoison.Response{body: body}} ->
        %{"aisle_number" => a, "product_name" => p} = Jason.decode!(body)
        {a, p}

      {:error, error} ->
        IO.inspect(error, label: "ERROR")
        nil
    end
  end
end
