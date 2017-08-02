defmodule HelpOn.RequestController do
  use HelpOn.Web, :controller

  alias HelpOn.RequestProvider

  def handleRequest(conn, %{"type" => requestType, "id" => id }) do 
    #render conn, "request.html", %{requestType: requestType, id: id}
    element = Integer.parse(id)
    RequestProvider.getService(elem(element, 0))
    json conn, %{id: 1}
  end  
end
