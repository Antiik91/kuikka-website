defmodule KuikkaWebsite.Web.Page.HomeController do
  use KuikkaWebsite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end