defmodule HelpOn.ProviderTest do
  use HelpOn.ModelCase

  alias HelpOn.Provider

  @valid_attrs %{active: 42, closeOperation: %{hour: 14, min: 0, sec: 0}, contactPerson: "some content", dateCreated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, email: "some content", location: "some content", mobileNo: "some content", name: "some content", rating: 42, startOperation: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Provider.changeset(%Provider{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Provider.changeset(%Provider{}, @invalid_attrs)
    refute changeset.valid?
  end
end
