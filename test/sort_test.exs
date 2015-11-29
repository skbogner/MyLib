defmodule SortTest do
  use ExUnit.Case

  # Test documentation examples
  doctest MyLib.Sort

  ### Testing ###
  # Insertion Sort
  test "insertion_sort" do
    assert MyLib.Sort.insertion_sort([-2, 5, 3, 1, 9]) == [-2, 1, 3, 5, 9]
    assert MyLib.Sort.insertion_sort([]) == []
  end

end
