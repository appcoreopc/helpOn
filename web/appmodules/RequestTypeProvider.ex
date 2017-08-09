defmodule HelpOn.RequestTypeProvider do 
  alias HelpOn.RequestType
  import Poison
  import Ecto.Query

   def getService(id) do 
       case HelpOn.Repo.get(RequestType, id) do
       nil -> nil 
       request -> request
       end 
   end 

   def getAllService() do 
       case HelpOn.Repo.all(RequestType) do
       nil -> nil 
       request -> request
       end 
   end 

   def createRequest(conn, params) do 

    elementActive = Integer.parse(params["active"])
    active = elem(elementActive, 0)

    HelpOn.Repo.insert %HelpOn.RequestType{"dateCreated":  params["dateCreated"], "name": params["name"], 
    "active":  active} 
   end

   def deleteRequest(id) do 
    dataRecord = getService(id)
    if dataRecord != nil do 
       HelpOn.Repo.delete(dataRecord) 
    end
   end 

   def updateRequest(id, params) do 
     dataRecord = getService(id)
     elementActive = Integer.parse(params["active"])
     active = elem(elementActive, 0)

    if dataRecord != nil do 
      dataRecord = Ecto.Changeset.change dataRecord, "dateCreated":  params["dateCreated"], 
      "name": params["name"], "active": active
      HelpOn.Repo.update dataRecord 
    end
   end
end 