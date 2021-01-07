defmodule ProductsQL.Resolvers.Products do
  @moduledoc """
  GraphQL Resolver for Loans context
  """

  alias Products.Schema

  def list_aisles(_parent, args, _context) do
    {:ok, Schema.list_aisles(args)}
  end
end
