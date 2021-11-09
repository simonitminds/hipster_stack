defmodule WithElm.IndustriesTest do
  use WithElm.DataCase

  alias WithElm.Industries

  describe "industries" do
    alias WithElm.Industries.Industry

    import WithElm.IndustriesFixtures

    @invalid_attrs %{isAutomotive: nil, title: nil}

    test "list_industries/0 returns all industries" do
      industry = industry_fixture()
      assert Industries.list_industries() == [industry]
    end

    test "get_industry!/1 returns the industry with given id" do
      industry = industry_fixture()
      assert Industries.get_industry!(industry.id) == industry
    end

    test "create_industry/1 with valid data creates a industry" do
      valid_attrs = %{isAutomotive: true, title: "some title"}

      assert {:ok, %Industry{} = industry} = Industries.create_industry(valid_attrs)
      assert industry.isAutomotive == true
      assert industry.title == "some title"
    end

    test "create_industry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Industries.create_industry(@invalid_attrs)
    end

    test "update_industry/2 with valid data updates the industry" do
      industry = industry_fixture()
      update_attrs = %{isAutomotive: false, title: "some updated title"}

      assert {:ok, %Industry{} = industry} = Industries.update_industry(industry, update_attrs)
      assert industry.isAutomotive == false
      assert industry.title == "some updated title"
    end

    test "update_industry/2 with invalid data returns error changeset" do
      industry = industry_fixture()
      assert {:error, %Ecto.Changeset{}} = Industries.update_industry(industry, @invalid_attrs)
      assert industry == Industries.get_industry!(industry.id)
    end

    test "delete_industry/1 deletes the industry" do
      industry = industry_fixture()
      assert {:ok, %Industry{}} = Industries.delete_industry(industry)
      assert_raise Ecto.NoResultsError, fn -> Industries.get_industry!(industry.id) end
    end

    test "change_industry/1 returns a industry changeset" do
      industry = industry_fixture()
      assert %Ecto.Changeset{} = Industries.change_industry(industry)
    end
  end
end
