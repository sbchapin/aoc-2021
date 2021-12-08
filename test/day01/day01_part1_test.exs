defmodule Day01Part01Test do
  use ExUnit.Case
  doctest Day01Part01

  test "list contains three increasing values" do
    assert Day01Part01.count_greater_than_before([1, 2, 3, 4]) == 3
  end

  test "list contains two increasing values and one same value repeated" do
    assert Day01Part01.count_greater_than_before([1, 2, 2, 2, 3]) == 2
    assert Day01Part01.count_greater_than_before([1, 2, 3, 3, 3]) == 2
    assert Day01Part01.count_greater_than_before([1, 1, 1, 2, 3]) == 2
  end

  test "list contains two increasing values and two decreasing values" do
    assert Day01Part01.count_greater_than_before([3, 2, 1, 2, 3]) == 2
    assert Day01Part01.count_greater_than_before([1, 2, 3, 2, 1]) == 2
  end
end
