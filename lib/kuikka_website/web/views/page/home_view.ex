defmodule KuikkaWebsite.Web.Page.HomeView do
  use KuikkaWebsite.Web, :view

  alias KuikkaWebsite.Web.LayoutView

  defdelegate render_page(page), to: LayoutView
end
