defmodule HelpOn.RequestController do
  use HelpOn.Web, :controller

  alias HelpOn.RequestProvider
  alias HelpOn.User
  

  def handleRequest(conn, %{"type" => requestType, "id" => id }) do 
    import Poison
    import Ecto.Query

    #users = HelpOn.Repo.all(from u in User, select: { u.name, u.email})
    #IO.inspect users

    #render conn, "request.html", %{requestType: requestType, id: id}
    element = Integer.parse(id)
    dataRecord = RequestProvider.getService(elem(element, 0))
    data = HelpOn.EctoHelper.strip_meta(dataRecord)

    IO.inspect data

    if dataRecord != nil do
      Poison.encode!(data)
      #json conn, to_string Poison.Encoder.encode(dataRecord, [])
      json conn,  data
    end
    json conn, %{id: 1}
  end  
end
