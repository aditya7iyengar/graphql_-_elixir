defmodule StoreAdmin.GraphQL do
  @url "http://localhost:4000/graphql_api/"

  @query """
  query {
    aisles(first: 1, min_capacity: $size, type: $storage_type) {
      number
      products(first: 1) {
        name
      }
    }
  }
  """

  def aisle_for_product(storage_type, size) do
    resp =
      HTTPoison.post(
        @url,
        %{
          query: @query,
          variables: %{
            storage_type: storage_type,
            size: size
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
