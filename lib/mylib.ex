defmodule MyLib do

  def main(argv) do
    {length, _} = argv |> hd |> Integer.parse
    IO.puts "Timing with list length #{length}"

    random_list(length)
    |> time_sort(:insertion_sort)
  end

  # Times function
  defp time_sort(list, function) do
    IO.puts "-#{function}"
    {ns, _} = :timer.tc(MyLib.Sort, function, [list])
    IO.puts "  #{ns/1_000_000}s"
    list
  end

  # Returns a random list of given length
  defp random_list(0), do: []
  defp random_list(length) when is_integer(length) do
    [MyLib.Random.random() | random_list(length-1)]
  end

end
