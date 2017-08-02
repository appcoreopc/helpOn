defmodule HelpOn.Repo.Migrations.CreateRequestType do
  use Ecto.Migration

  def change do
    create table(:requesttypes) do
      add :name, :string
      add :dateCreated, :datetime
      add :createdBy, :string
      add :active, :integer

      timestamps()
    end

  end
end
