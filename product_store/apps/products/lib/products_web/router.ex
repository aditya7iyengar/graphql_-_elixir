defmodule ProductsWeb.Router do
  use ProductsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProductsWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/aisles", AisleController, except: [:new, :edit]
    resources "/products", ProductController, except: [:new, :edit]
  end
end
