defmodule HelpOn.RequestProvider do 
   alias HelpOn.Request
   import Ecto.Query
   import Poison

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

end 