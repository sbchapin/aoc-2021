defmodule Day01Part02Test do
  use ExUnit.Case
  doctest Day01Part02

  test "list with three values gets window-summed to one" do
    assert Day01Part02.summarize_window([1, 2, 3]) == [6]
    assert Day01Part02.summarize_window([2, 3, 4]) == [9]
    assert Day01Part02.summarize_window([3, 4, 5]) == [12]
  end

  test "list with four values gets window-summed to two" do
    assert Day01Part02.summarize_window([1, 2, 3, 4]) == [6, 9]
    assert Day01Part02.summarize_window([2, 3, 4, 5]) == [9, 12]
  end

  test "list with five values gets window-summed to three" do
    assert Day01Part02.summarize_window([1, 2, 3, 4, 5]) == [6, 9, 12]
  end
end
