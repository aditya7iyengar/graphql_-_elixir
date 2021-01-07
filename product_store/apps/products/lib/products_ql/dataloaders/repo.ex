defmodule ProductsQL.Dataloaders.Repo do
  @moduledoc """
  Data source for Products
  """

  def data do
    Dataloader.Ecto.new(Products.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
