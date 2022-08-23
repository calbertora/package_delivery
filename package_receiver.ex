defmodule PackageReceiver do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def leave_at_the_door(pid, package) do
    GenServer.cast(pid, {:async_package, package})
  end

  def leave_at_the_door_sync(pid, package) do
    GenServer.call(pid, {:sync_package, package})
  end

  def handle_cast({:async_package, package_name}, state) do
    :timer.sleep(1000)
    IO.puts "I received package: #{package_name}"
    {:noreply, state}
  end

  def handle_call({:sync_package, package_name},_from, state) do
    :timer.sleep(1000)
    IO.puts "I received package: #{package_name}"
    {:reply, state, state}
  end
end
