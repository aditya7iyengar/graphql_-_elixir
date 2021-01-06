defmodule ProductsWeb.AisleControllerTest do
  use ProductsWeb.ConnCase

  alias Products.Schema
  alias Products.Schema.Aisle

  @create_attrs %{
    capacity: 42,
    number: 42,
    type: "some type"
  }
  @update_attrs %{
    capacity: 43,
    number: 43,
    type: "some updated type"
  }
  @invalid_attrs %{capacity: nil, number: nil, type: nil}

  def fixture(:aisle) do
    {:ok, aisle} = Schema.create_aisle(@create_attrs)
    aisle
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all aisles", %{conn: conn} do
      conn = get(conn, Routes.aisle_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create aisle" do
    test "renders aisle when data is valid", %{conn: conn} do
      conn = post(conn, Routes.aisle_path(conn, :create), aisle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.aisle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "capacity" => 42,
               "number" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.aisle_path(conn, :create), aisle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update aisle" do
    setup [:create_aisle]

    test "renders aisle when data is valid", %{conn: conn, aisle: %Aisle{id: id} = aisle} do
      conn = put(conn, Routes.aisle_path(conn, :update, aisle), aisle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.aisle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "capacity" => 43,
               "number" => 43,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, aisle: aisle} do
      conn = put(conn, Routes.aisle_path(conn, :update, aisle), aisle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete aisle" do
    setup [:create_aisle]

    test "deletes chosen aisle", %{conn: conn, aisle: aisle} do
      conn = delete(conn, Routes.aisle_path(conn, :delete, aisle))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.aisle_path(conn, :show, aisle))
      end
    end
  end

  defp create_aisle(_) do
    aisle = fixture(:aisle)
    %{aisle: aisle}
  end
end
