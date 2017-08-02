defmodule HelpOn.RequestProvider do 
   alias HelpOn.Request
   import Ecto.Query
   import Poison

   def getService(id) do 
       service = HelpOn.Repo.get(Request, id)
       if service != nil do 
          service
        end 
   end 
end 