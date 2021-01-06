defmodule StoreAdmin.REST do
  @url "http://localhost:4000/api/aisles/for_product"

  def aisle_for_product(storage_type, size, category_name) do
    resp = HTTPoison.get(url_with_params(storage_type, size, category_name))

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

  defp url_with_params(storage_type, size, category_name) do
    @url <> "?storage_type=#{storage_type}&size=#{size}&category_name=#{category_name}"
  end
end
