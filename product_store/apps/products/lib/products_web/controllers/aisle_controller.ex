defmodule ProductsWeb.AisleController do
  use ProductsWeb, :controller

  alias Products.Schema
  alias Products.Schema.Aisle

  action_fallback ProductsWeb.FallbackController

  def index(conn, _params) do
    aisles = Schema.list_aisles()
    render(conn, "index.json", aisles: aisles)
  end

  def create(conn, %{"aisle" => aisle_params}) do
    with {:ok, %Aisle{} = aisle} <- Schema.create_aisle(aisle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.aisle_path(conn, :show, aisle))
      |> render("show.json", aisle: aisle)
    end
  end

  def show(conn, %{"id" => id}) do
    aisle = Schema.get_aisle!(id)
    render(conn, "show.json", aisle: aisle)
  end

  def update(conn, %{"id" => id, "aisle" => aisle_params}) do
    aisle = Schema.get_aisle!(id)

    with {:ok, %Aisle{} = aisle} <- Schema.update_aisle(aisle, aisle_params) do
      render(conn, "show.json", aisle: aisle)
    end
  end

  def delete(conn, %{"id" => id}) do
    aisle = Schema.get_aisle!(id)

    with {:ok, %Aisle{}} <- Schema.delete_aisle(aisle) do
      send_resp(conn, :no_content, "")
    end
  end
end
