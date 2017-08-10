defmodule HelpOn.ProviderService do 

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
    
    providerRating = Integer.parse(params["rating"])
    rating = elem(providerRating, 0)

    startTime = Ecto.Time.cast params["startOperation"]
    start = elem(startTime, 1)

    closeTime = Ecto.Time.cast params["closeOperation"]
    close = elem(closeTime, 1)

    HelpOn.Repo.insert %HelpOn.Provider {"dateCreated": Ecto.DateTime.utc, "name": params["name"], 
    "email":  params["email"], "mobileNo": params["mobileNo"], "rating": rating, 
    "location": params["location"], "contactPerson":  params["contactPerson"], 
    "active": params["active"], "startOperation": start, "closeOperation": close } 

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

      providerRating = Integer.parse(params["rating"])
      rating = elem(providerRating, 0)

      startTime = Ecto.Time.cast params["startOperation"]
      start = elem(startTime, 1)

      closeTime = Ecto.Time.cast params["closeOperation"]
      close = elem(closeTime, 1)

      dataRecord = Ecto.Changeset.change dataRecord, "dateCreated":  params["dateCreated"], "name": params["name"], 
    "email":  params["email"], "mobileNo": params["mobileNo"], "rating": rating, 
    "location": params["location"], "contactPerson":  params["contactPerson"], 
    "active": params["active"], "startOperation": start, 
    "closeOperation": close

      HelpOn.Repo.update dataRecord 

    end
   end
end 