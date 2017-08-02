defmodule HelpOn.Request do
  use HelpOn.Web, :model

  schema "requests" do
    belongs_to :type, HelpOn.Type
    belongs_to :provider, HelpOn.Provider

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
