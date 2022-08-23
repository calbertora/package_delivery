defmodule SomeModule do
  alias PackageReceiver

  def get_those_packages_out do
    packages = ["Book", "Bat", "Broom", "Bananas"]
    {:ok, pid} = PackageReceiver.start_link
    Enum.each(packages, fn p ->
      IO.puts "Delivering package: #{p}"

      #PackageReceiver.leave_at_the_door(pid, p)
      PackageReceiver.leave_at_the_door_sync(pid, p)
    end)

    IO.puts "All done with deliveries"
    IO.puts "------------------------"
  end
end
