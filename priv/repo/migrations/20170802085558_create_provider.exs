defmodule HelpOn.Repo.Migrations.CreateProvider do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :name, :string
      add :email, :string
      add :mobileNo, :string
      add :dateCreated, :datetime
      add :rating, :integer
      add :location, :string
      add :contactPerson, :string
      add :active, :integer
      add :startOperation, :time
      add :closeOperation, :time

      timestamps()
    end

  end
end
