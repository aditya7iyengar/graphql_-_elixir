defmodule ProductsWeb.AisleView do
  use ProductsWeb, :view
  alias ProductsWeb.AisleView

  def render("index.json", %{aisles: aisles}) do
    %{data: render_many(aisles, AisleView, "aisle.json")}
  end

  def render("show.json", %{aisle: aisle}) do
    %{data: render_one(aisle, AisleView, "aisle.json")}
  end

  def render("aisle.json", %{aisle: aisle}) do
    %{id: aisle.id, number: aisle.number, type: aisle.type, capacity: aisle.capacity}
  end
end
