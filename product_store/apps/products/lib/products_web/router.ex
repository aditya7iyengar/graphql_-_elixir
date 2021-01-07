defmodule ProductsWeb.Router do
  use ProductsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql_api do
    plug :accepts, ["json"]

    plug ProductsQL.Context
  end

  scope "/api", ProductsWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
    get "/aisles/for_product", AisleController, :for_product
    resources "/aisles", AisleController, except: [:new, :edit]
    resources "/products", ProductController, except: [:new, :edit]
  end

  scope "/graphql_api" do
    pipe_through [:graphql_api]

    forward "/", Absinthe.Plug, schema: ProductsQL.Schema
  end

  if Mix.env() == :dev do
    # Enables GraphiQL only for development
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      default_url: "/graphql_api",
      schema: ProductsQL.Schema,
      socket: ProductsWeb.UserSocket,
      interface: :advanced
  end
end
