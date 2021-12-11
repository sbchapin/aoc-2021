defmodule Day02Part02Test do
  use ExUnit.Case
  doctest Day02Part02

  test "interpret executes up instruction, decreasing aim" do
    assert Day02Part02.interpret(up: 1) == {0, 0, -1}
  end

  test "interpret executes down instruction, increasing aim" do
    assert Day02Part02.interpret(down: 2) == {0, 0, 2}
  end

  test "interpret executes forward instruction, increasing x (horizontal position)" do
    assert Day02Part02.interpret(forward: 3) == {3, 0, 0}
  end

  test "interpret executes forward instruction before executing down, with aim unaffected" do
    assert Day02Part02.interpret(forward: 3, down: 2) == {3, 0, 2}
  end

  test "interpret executes forward instruction after executing down, with aim affecting the result" do
    assert Day02Part02.interpret(down: 2, forward: 3) == {3, 6, 2}
  end

  test "can tokenize, parse, and execute a valid program" do
    program = """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """

    expected = {
      5 + 8 + 2,
      8 * 5 + 2 * 10,
      5 - 3 + 8
    }

    actual = program |> Day02Part01.tokenize() |> Day02Part01.parse() |> Day02Part02.interpret()

    assert actual == expected
  end
end
