
defmodule HelpOn.Router do
  use HelpOn.Web, :router
  alias HelpOn.Plugs.Test
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelpOn.Plugs.Test, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelpOn do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index

    # Request 
    get "/request/:id", RequestController, :handleRequest
    post "/request", RequestController, :createRequest
    delete "/request/:id", RequestController, :cancelRequest
    put "/request/:id", RequestController, :updateRequest

    # Provider  
    get "/provider/:id", ProviderController, :handleRequest
    post "/provider", ProviderController, :createRequest
    delete "/provider/:id", ProviderController, :cancelRequest
    put "/provider/:id", ProviderController, :updateRequest

    # Request Types  
    get "/requesttype/:id", RequestTypesController, :handleRequest
    post "/requesttype", RequestTypesController, :createRequest
    delete "/requesttype/:id", RequestTypesController, :cancelRequest
    put "/requesttype/:id", RequestTypesController, :updateRequest

  end

  # Other scopes may use custom stacks.
   scope "/api", HelpOn do
     pipe_through :api
   end
end

