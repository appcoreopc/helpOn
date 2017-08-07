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
  def createRequest(conn, params) do 
   
   elementPriority = Integer.parse(params["priority"])
   priority = elem(elementPriority, 0)

   elementServiceRating = Integer.parse(params["serviceRating"])
   serviceRating = elem(elementServiceRating, 0)

   elementStatus = Integer.parse(params["status"])
   status = elem(elementStatus, 0)

   elementType = Integer.parse(params["type"])
   requesttype = elem(elementType, 0)

   providerType = Integer.parse(params["provider"])
   provider = elem(providerType, 0)

  
   #json(conn, %{body: params})    

   # %{"dateCreated" =>  dateCreated, "priority" => priority, "description" => description, 
   #"details" => details, "mobileNo" => mobileNo, "email" => email, "contact" => contact, "address" => address, 
   #"status" => status, "state" => state, "serviceRating" => serviceRating, "customerFeedback" => customerFeedback  }
   #[:dateCreated, :priority, :description, :details, :mobileNo, :email, :contact, :address, :status, :serviceRating, :customerFeedback]

  
   case HelpOn.Repo.insert %HelpOn.Request{"dateCreated":  params["dateCreated"], "priority":  priority, "description": params["description"], 
   "details":  params["details"], "mobileNo": params["mobileNo"], "email":  params["email"], "contact":  params["contact"], "address":  params["address"], 
   "status": status, "serviceRating": serviceRating, "customerFeedback": params["customerFeedback"], 
   "type": requesttype, "provider": provider} do 
     {:ok, struct} -> json conn, %{message: "Record successfully inserted"}
     {:error, changeset} -> json conn, %{message: "Error inserting record"}
   end

   #case HelpOn.Repo.insert(%Requests{params}) 
   # do 
   #  {:ok, struct} -> json conn, %{message: "Record successfully inserted"}
   #  {:error, changeset} -> json conn, %{message: "Error inserting record"}
   #end

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
