defmodule HelpOn.Provider do 
  alias HelpOn.Provider
  import Poison
  import Ecto.Query

   def getService(id) do 
       case HelpOn.Repo.get(Provider, id) do
       nil -> nil 
       request -> request
       end 
   end 

   def getAllService() do 
       case HelpOn.Repo.all(Provider) do
       nil -> nil 
       request -> request
       end 
   end 

   def createRequest(conn, params) do 
    
    providerType = Integer.parse(params["provider"])
    provider = elem(providerType, 0)

    HelpOn.Repo.insert %HelpOn.Provider{"dateCreated":  params["dateCreated"], "name": params["name"], 
    "email":  params["email"], "mobileNo": params["mobileNo"], "rating": params["rating"], 
    "location": params["locaton"], "contactPerson":  params["contactPerson"], 
    "active": params["active"], "startOperation": params["startOperation"], 
    "closeOperation": params["closeOperation"]} 
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
    
      dataRecord = Ecto.Changeset.change "dateCreated":  params["dateCreated"], "name": params["name"], 
    "email":  params["email"], "mobileNo": params["mobileNo"], "rating": params["rating"], 
    "location": params["locaton"], "contactPerson":  params["contactPerson"], 
    "active": params["active"], "startOperation": params["startOperation"], 
    "closeOperation": params["closeOperation"]

      HelpOn.Repo.update dataRecord 
    end
   end
end 