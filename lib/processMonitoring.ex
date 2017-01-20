defmodule ProcessMonitoring do
  def explode, do: exit(:kaboom)
  def run do
    {pid, ref} = spawn_monitor(ProcessMonitoring, :explode, [])

    receive do
      {:DOWN, ref, :process, from_pid, reason } -> IO.puts "Exit reason: #{reason}"

    end
  end
end
