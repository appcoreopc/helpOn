defmodule HelpOn.RequestType do
  use HelpOn.Web, :model

  schema "requesttypes" do
    field :name, :string
    field :dateCreated, Ecto.DateTime
    field :createdBy, :string
    field :active, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :dateCreated, :createdBy, :active])
    |> validate_required([:name, :dateCreated, :createdBy, :active])
  end
end
