defmodule BugWeb.BugLive do
  use BugWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, test: "é")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.live_component module={BugWeb.BugComponent} id="bug_component" />
    """
  end

  def handle_info(:unhandled, socket) do
    {:noreply, socket}
  end
end
