defmodule StoreAdmin.GraphQL do
  @url "http://localhost:4000/graphql_api/"

  def aisle_for_product(storage_type, size) do
    resp =
      HTTPoison.post(
        @url,
        %{
          query: query(size, storage_type)
        }
        |> Jason.encode!(),
        [{"Content-Type", "application/json"}]
      )

    case resp do
      {:ok, %HTTPoison.Response{body: body}} ->
        %{"data" => %{"aisles" => aisles}} = Jason.decode!(body)
        parse_aisles(aisles)

      {:error, error} ->
        IO.inspect(error, label: "ERROR")
        nil
    end
  end

  defp parse_aisles([]), do: nil

  defp parse_aisles(aisles) do
    aisle = Enum.at(aisles, 0)
    %{"products" => [%{"name" => name} | _tail]} = aisle

    {Map.get(aisle, "number"), name}
  end

  def query(size, storage_type) do
    """
    query {
      aisles(first: 1, minCapacity: #{size}, storageType: "#{storage_type}") {
        number
        products {
          name
        }
      }
    }
    """
  end
end
