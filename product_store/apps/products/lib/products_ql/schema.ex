defmodule ProductsQL.Schema do
  @moduledoc """
  Main Absinthe Schema for Products
  """

  use Absinthe.Schema

  alias ProductsQL.Dataloaders.Repo

  import_types(Absinthe.Type.Custom)
  import_types(ProductsQL.Schema.Products)

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Repo, Repo.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    import_fields(:queries)
  end
end
