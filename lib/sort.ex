defmodule MyLib.Sort do

  @doc """
  Sorts the input list using Insertion Sort.
  O(n^2) running time.

  ## Example

    iex> list = [-100, 0, 400, 1.234, -9_000_000]
    iex> MyLib.Sort.insertion_sort(list)
    [-9_000_000, -100, 0, 1.234, 400]

  """
  def insertion_sort(lst) do
    # Recurse on the list putting them into the result in the correct place
    insertion_sort(lst, [])
  end

  # base case
  defp insertion_sort([], result) do
    result
  end # recursion
  defp insertion_sort([head | tail], result) do
    # Insert element at correct location
    insertion_sort(tail, insert_into(head, result))
  end

  # base case
  defp insert_into(nil, []), do: []
  defp insert_into(elem, []), do: [elem]

  # recursion
  defp insert_into(nil, [head|tail]), do: [head | insert_into(nil, tail)]
  defp insert_into(elem, lst = [head|tail]) do
    case (head <= elem) do # if elem larger
      true -> [head | insert_into(elem, tail)] # continue without inserting
      false -> [elem | insert_into(nil, lst)] # otherwise insert it
    end
  end
end
