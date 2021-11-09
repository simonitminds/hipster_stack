defmodule WithElmWeb.IndustryView do
  use WithElmWeb, :view
  alias WithElmWeb.IndustryView

  def render("index.json", %{industries: industries}) do
    %{data: render_many(industries, IndustryView, "industry.json")}
  end

  def render("show.json", %{industry: industry}) do
    %{data: render_one(industry, IndustryView, "industry.json")}
  end

  def render("industry.json", %{industry: industry}) do
    %{
      id: industry.id,
      title: industry.title,
      isAutomotive: industry.isAutomotive
    }
  end
end
