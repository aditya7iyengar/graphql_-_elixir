defmodule ProductsWeb.CategoryView do
  use ProductsWeb, :view
  alias ProductsWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      code: category.code,
      description: category.description
    }
  end
end
