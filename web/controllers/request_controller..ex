defmodule HelpOn.RequestController do
  use HelpOn.Web, :controller

  def handleRequest(conn, %{"type" => requestType, "id" => id }) do 
    #render conn, "request.html", %{requestType: requestType, id: id}
    json conn, %{id: 1}
  end  
end
