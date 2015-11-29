defmodule MyLib.Sort do

  ## Insert element into sorted list
  # base case
  defp insert_into(nil, []), do: []
  defp insert_into(elem, []), do: [elem]
  # recursion
  defp insert_into(nil, [head | tail]), do: [head | insert_into(nil, tail)]
  defp insert_into(elem, lst = [head|tail]) do
    case (head <= elem) do # if elem larger
      true -> [head | insert_into(elem, tail)] # continue without inserting
      false -> [elem | insert_into(nil, lst)] # otherwise insert it
    end
  end


  @doc """
  Sorts list using Merge Sort.
  O(n*logn) running time.
  """
  def merge_sort([]), do: []
  def merge_sort(lst) do
    # Divide
    case split(lst, div((length lst), 2)) do
      {[], []} -> []
      {lst, []} -> lst
      {[], lst} -> lst
      {left, right} -> merge(merge_sort(left), merge_sort(right))
    end
  end

  #split
  defp split(lst, index), do: split(lst, index, 0, [])
  defp split([], _, _, left), do: {left, []}
  defp split(lst = [head|tail], index, count, left) do
    case count >= index do
      true -> {left, lst}
      false -> split(tail, index, count + 1, [head | left])
    end
  end

  # merge
  defp merge([], []), do: []
  defp merge(lst, []), do: lst
  defp merge([], lst), do: lst
  defp merge(left = [left_head | left_tail], right = [right_head | right_tail]) do
    case left_head <= right_head do
      true -> [left_head | merge(left_tail, right)]
      false -> [right_head | merge(left, right_tail)]
    end
  end


  @doc """
  Sorts list using Insertion Sort.
  O(n^2) running time.
  """
  def insertion_sort(lst), do: insertion_sort(lst, [])
  defp insertion_sort([], result), do: result
  defp insertion_sort([head | tail], result) do
    insertion_sort(tail, insert_into(head, result))
  end
end
