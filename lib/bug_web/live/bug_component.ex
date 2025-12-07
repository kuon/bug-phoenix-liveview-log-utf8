defmodule BugWeb.BugComponent do
  use BugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-4">
      <button
        phx-click="test"
        phx-target={@myself}
        class={[
          "px-4 py-2",
          "text-white bg-blue-500 rounded",
          "hover:bg-blue-600"
        ]}
      >
        Test
      </button>
    </div>
    """
  end

  @impl true
  def handle_event("test", _params, socket) do
    send(self(), {:test_message, "test"})

    socket
    |> then(fn socket -> {:noreply, socket} end)
  end
end
