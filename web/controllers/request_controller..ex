defmodule HelpOn.RequestController do
  use HelpOn.Web, :controller
  alias HelpOn.RequestProvider
  alias HelpOn.User
  import Poison
  import Ecto.Query

@doc """
  Handles service request for GET request.
  """
def handleRequest(conn, %{"id" => id }) do 
    
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
    else 
      json conn,  %{messsage: "No record found."}
    end
  end  

  @doc """
  Create a new service request
  """
  def createRequest(conn, %{"name" =>  name, "type" => type, "email" => email }) do 
    IO.puts name
    IO.puts type
    json conn, %{id: 1}
  end 

  def cancelRequest(conn, %{"id" => id}) do 
    element = Integer.parse(id)
    dataRecord = RequestProvider.getService(elem(element, 0))
    if dataRecord != nil do 
      case HelpOn.Repo.delete(dataRecord) do 
       {:ok, struct} -> json conn, %{messsage: "Record successfully removed."}
       {:error, changeste} -> json conn, %{messsage: "Record remove failed."}
      end
    end
    json conn,  %{messsage: "No record found."}
  end 

  def updateRequest(conn) do 
    json conn, %{id: 1}
  end 

end
