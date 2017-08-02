defmodule HelpOn.Request do
  use HelpOn.Web, :model

  schema "requests" do
    field :dateCreated, Ecto.DateTime
    field :priority, :integer
    field :description, :string
    field :details, :string
    field :mobileNo, :string
    field :email, :string
    field :contact, :string
    field :address, :string
    field :status, :integer
    field :serviceRating, :integer
    field :customerFeedback, :string
    field :type, :integer
    field :provider, :integer
    #belongs_to :name, HelpOn.RequestType
    #belongs_to :provider, HelpOn.Provider

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:dateCreated, :priority, :description, :details, :mobileNo, :email, :contact, :address, :status, :serviceRating, :customerFeedback])
    |> validate_required([:dateCreated, :priority, :description, :details, :mobileNo, :email, :contact, :address, :status, :serviceRating, :customerFeedback])
  end
end
