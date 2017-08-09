defmodule HelpOn.RequestProvider do 
  alias HelpOn.User
  alias HelpOn.Request
  import Poison
  import Ecto.Query

   def getService(id) do 
       case HelpOn.Repo.get(Request, id) do
       nil -> nil 
       request -> request
       end 
   end 

   def getAllService() do 
       case HelpOn.Repo.all(Request) do
       nil -> nil 
       request -> request
       end 
   end 

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

    HelpOn.Repo.insert %HelpOn.Request{"dateCreated":  params["dateCreated"], "priority":  priority, "description": params["description"], 
    "details":  params["details"], "mobileNo": params["mobileNo"], "email":  params["email"], "contact":  params["contact"], "address":  params["address"], 
    "status": status, "serviceRating": serviceRating, "customerFeedback": params["customerFeedback"], 
    "type": requesttype, "provider": provider} 
   end

   def deleteRequest(id) do 
    dataRecord = getService(id)
    if dataRecord != nil do 
       HelpOn.Repo.delete(dataRecord) 
    end
   end 

   def updateRequest(id, params) do 
     dataRecord = getService(id)

    if dataRecord != nil do 
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

      dataRecord = Ecto.Changeset.change dataRecord, "dateCreated":  params["dateCreated"], "priority": priority, "description": params["description"], 
   "details":  params["details"], "mobileNo": params["mobileNo"], "email":  params["email"], "contact":  params["contact"], "address":  params["address"], 
   "status": status, "serviceRating": serviceRating, "customerFeedback": params["customerFeedback"], 
   "type": requesttype, "provider": provider

      HelpOn.Repo.update dataRecord 
    end
   end
end 