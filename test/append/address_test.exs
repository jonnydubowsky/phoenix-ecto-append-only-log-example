defmodule Append.AddressTest do
  use Append.DataCase
  alias Append.Address

  test "add item to database" do
    assert {:ok, item} = insert_address()

    assert item.name == "Thor"
  end

  describe "get item from database" do
    test "get/1" do
      {:ok, item} = insert_address()

      assert Address.get(item.id) == item
    end

    test "get_by/1" do
      {:ok, item} = insert_address()

      assert Address.get_by(name: "Thor") == item
    end
  end

  test "update item in database" do
    {:ok, item} = insert_address()

    {:ok, updated_item} = Address.update(item, %{tel: "0123444444"})

    assert updated_item.name == item.name
    assert updated_item.tel != item.tel
  end

  def insert_address do
    Address.insert(%{
      name: "Thor",
      address_line_1: "The Hall",
      address_line_2: "Valhalla",
      city: "Asgard",
      postcode: "AS1 3DG",
      tel: "0800123123"
    })
  end
end
