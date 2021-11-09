defmodule WithElmWeb.IndustryController do
  use WithElmWeb, :controller

  alias WithElm.Industries
  alias WithElm.Industries.Industry

  action_fallback WithElmWeb.FallbackController

  def index(conn, _params) do
    industries = Industries.list_industries()
    render(conn, "index.json", industries: industries)
  end

  def create(conn, %{"industry" => industry_params}) do
    with {:ok, %Industry{} = industry} <- Industries.create_industry(industry_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.industry_path(conn, :show, industry))
      |> render("show.json", industry: industry)
    end
  end

  def show(conn, %{"id" => id}) do
    industry = Industries.get_industry!(id)
    render(conn, "show.json", industry: industry)
  end

  def update(conn, %{"id" => id, "industry" => industry_params}) do
    industry = Industries.get_industry!(id)

    with {:ok, %Industry{} = industry} <- Industries.update_industry(industry, industry_params) do
      render(conn, "show.json", industry: industry)
    end
  end

  def delete(conn, %{"id" => id}) do
    industry = Industries.get_industry!(id)

    with {:ok, %Industry{}} <- Industries.delete_industry(industry) do
      send_resp(conn, :no_content, "")
    end
  end
end
