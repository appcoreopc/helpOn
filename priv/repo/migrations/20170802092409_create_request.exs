defmodule HelpOn.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :dateCreated, :datetime
      add :priority, :integer
      add :description, :string
      add :details, :string
      add :mobileNo, :string
      add :email, :string
      add :contact, :string
      add :address, :string
      add :status, :integer
      add :serviceRating, :integer
      add :customerFeedback, :string
      add :type, references(:requesttypes, on_delete: :nothing)
      add :provider, references(:providers, on_delete: :nothing)

      timestamps()
    end
    create index(:requests, [:type])
    create index(:requests, [:provider])

  end
end
