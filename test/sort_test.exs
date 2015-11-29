defmodule SortTest do
  use ExUnit.Case

  # Test documentation examples
  doctest MyLib.Sort

  ### Testing ###

  test "insertion_sort", do: test_sort(&MyLib.Sort.insertion_sort/1)
  test "merge_sort", do: test_sort(&MyLib.Sort.merge_sort/1)

  # Test any sorting function
  defp test_sort(sort_function) do
    assert sort_function.([1, 0, -20_000, 42, 7, 17, 0.5, 3.1415, 27, 11, 1992])
                      == [-20_000, 0, 0.5, 1, 3.1415, 7, 11, 17, 27, 42, 1992]
    assert sort_function.([]) == []
  end

end
