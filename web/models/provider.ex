defmodule HelpOn.Provider do
  use HelpOn.Web, :model

  schema "providers" do
    field :name, :string
    field :email, :string
    field :mobileNo, :string
    field :dateCreated, Ecto.DateTime
    field :rating, :integer
    field :location, :string
    field :contactPerson, :string
    field :active, :integer
    field :startOperation, Ecto.Time
    field :closeOperation, Ecto.Time

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :mobileNo, :dateCreated, :rating, :location, :contactPerson, :active, :startOperation, :closeOperation])
    |> validate_required([:name, :email, :mobileNo, :dateCreated, :rating, :location, :contactPerson, :active, :startOperation, :closeOperation])
  end
end
