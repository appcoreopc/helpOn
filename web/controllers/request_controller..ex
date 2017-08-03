defmodule HelpOn.RequestController do
  use HelpOn.Web, :controller

  alias HelpOn.RequestProvider
  alias HelpOn.User

  def handleRequest(conn, %{"type" => requestType, "id" => id }) do 
    import Poison
    import Ecto.Query

    users = HelpOn.Repo.all(from u in User, select: { u.name, u.email})
    IO.inspect users

    #render conn, "request.html", %{requestType: requestType, id: id}
    element = Integer.parse(id)
    dataRecord = RequestProvider.getAllService()

    if dataRecord != nil do
      #json conn, to_string Poison.Encoder.encode(dataRecord, [])
      json conn,  %{id: 1}
    end
    json conn, %{id: 1}
  end  
end
