defmodule HelpOn.RequestTypesController do
  use HelpOn.Web, :controller
  alias HelpOn.RequestProvider
  alias HelpOn.User
  import Poison
  import Ecto.Query
  
  @doc """
  Handles service request for GET request.
  """
  def handleRequest(conn, %{"id" => id }) do 
    element = Integer.parse(id)
    dataRecord = RequestProvider.getService(elem(element, 0))
    data = HelpOn.EctoHelper.strip_meta(dataRecord)
    
    if dataRecord != nil && data != nil do
      Poison.encode!(data)
      json conn,  data
    else 
      json conn,  %{messsage: "No record found."}
    end
  end  
  
  @doc """
  Create a new service request
  """
  def createRequest(conn, params) do 
    case RequestProvider.createRequest(conn, params) do 
      {:ok, struct} -> json conn, %{message: "Record successfully inserted"}
      {:error, changeset} -> json conn, %{message: "Error inserting record"}
    end
  end 
  
  def cancelRequest(conn, %{"id" => id}) do
    element = Integer.parse(id)    
    try do 
      case RequestProvider.deleteRequest(elem(element, 0)) do
        {:ok, struct} -> json conn, %{messsage: "Record successfully removed."}
        {:error, changeset} -> json conn, %{messsage: "Record remove failed."}
        nil -> json conn, %{message: "Unable find record to update."}
      end
    rescue 
      RuntimeError -> json conn, %{message: "Unable find error to update."}
      Ecto.NoPrimaryKeyFieldError -> json conn, %{message: "Unable find error to update."}
    end 
    json conn,  %{messsage: "No record found."}
  end 
  
  def updateRequest(conn, params) do 
    try do 
      element = Integer.parse(params["id"])
      case RequestProvider.updateRequest(elem(element, 0), params) do 
        {:ok, struct} -> json conn, %{message: "Record successfully updated."}
        {:error, changeset} -> json conn, %{message: "Error inserting record"}
        nil -> json conn, %{message: "Unable find record to update."}
      end
    rescue 
      e in RuntimeError  -> json conn, %{message: "opsss.."}
      e in Ecto.NoPrimaryKeyFieldError -> json conn, %{message: "Unable find error to update."}
    end 
  end
end