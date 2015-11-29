defmodule SortTest do
  use ExUnit.Case

  # Test documentation examples
  doctest MyLib.Sort

  # Setup
  @list_length 10000
  IO.puts "SORT"
  IO.puts " Testing with a list of length #{@list_length}"


  # Returns a random list of given length
  defp random_list(0), do: []
  defp random_list(length) do
    [MyLib.Random.random() | random_list(length-1)]
  end

  ### Testing ###
  # Insertion Sort
  test "insertion_sort" do
    assert MyLib.Sort.insertion_sort([-2, 5, 3, 1, 9]) == [-2, 1, 3, 5, 9]
    assert MyLib.Sort.insertion_sort([]) == []

  end

  ### Timing ###
  # Insertion Sort
  test "timer_insertion_sort" do
    IO.puts "- Insertion Sort..."
    {ms, _} = :timer.tc(MyLib.Sort, :insertion_sort, [random_list @list_length])
    IO.puts " #{ms/1_000_000}s"
  end


end
