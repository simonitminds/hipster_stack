defmodule WithElmWeb.IndustryControllerTest do
  use WithElmWeb.ConnCase

  import WithElm.IndustriesFixtures

  alias WithElm.Industries.Industry

  @create_attrs %{
    isAutomotive: true,
    title: "some title"
  }
  @update_attrs %{
    isAutomotive: false,
    title: "some updated title"
  }
  @invalid_attrs %{isAutomotive: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all industries", %{conn: conn} do
      conn = get(conn, Routes.industry_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create industry" do
    test "renders industry when data is valid", %{conn: conn} do
      conn = post(conn, Routes.industry_path(conn, :create), industry: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.industry_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "isAutomotive" => true,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.industry_path(conn, :create), industry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update industry" do
    setup [:create_industry]

    test "renders industry when data is valid", %{conn: conn, industry: %Industry{id: id} = industry} do
      conn = put(conn, Routes.industry_path(conn, :update, industry), industry: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.industry_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "isAutomotive" => false,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, industry: industry} do
      conn = put(conn, Routes.industry_path(conn, :update, industry), industry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete industry" do
    setup [:create_industry]

    test "deletes chosen industry", %{conn: conn, industry: industry} do
      conn = delete(conn, Routes.industry_path(conn, :delete, industry))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.industry_path(conn, :show, industry))
      end
    end
  end

  defp create_industry(_) do
    industry = industry_fixture()
    %{industry: industry}
  end
end
