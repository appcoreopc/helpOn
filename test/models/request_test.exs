defmodule HelpOn.RequestTest do
  use HelpOn.ModelCase

  alias HelpOn.Request

  @valid_attrs %{address: "some content", contact: "some content", customerFeedback: "some content", dateCreated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", details: "some content", email: "some content", mobileNo: "some content", priority: 42, serviceRating: 42, status: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Request.changeset(%Request{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Request.changeset(%Request{}, @invalid_attrs)
    refute changeset.valid?
  end
end
