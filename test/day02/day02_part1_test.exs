defmodule Day02Part01Test do
  use ExUnit.Case
  doctest Day02Part01

  test "tokenize splits on spaces" do
    assert Day02Part01.tokenize("a b c") == ["a", "b", "c"]
  end

  test "tokenize splits on newlines" do
    assert Day02Part01.tokenize("a\nb\nc") == ["a", "b", "c"]
  end

  test "tokenize trims whitespace" do
    assert Day02Part01.tokenize("a   b\n c") == ["a", "b", "c"]
  end

  test "parse extracts :up and a number" do
    assert Day02Part01.parse(["up", "1"]) == [up: 1]
  end

  test "parse extracts :down and a number" do
    assert Day02Part01.parse(["down", "2"]) == [down: 2]
  end

  test "parse extracts :forward and a number" do
    assert Day02Part01.parse(["forward", "3"]) == [forward: 3]
  end

  test "parse extracts :up, :down, and :forward preserving order" do
    tokens = [
      "up",
      "1",
      "down",
      "2",
      "forward",
      "3"
    ]

    expected = [
      up: 1,
      down: 2,
      forward: 3
    ]

    assert Day02Part01.parse(tokens) == expected
  end

  test "interpret executes up instruction, decreasing y (depth)" do
    assert Day02Part01.interpret(up: 1) == {0, -1}
  end

  test "interpret executes down instruction, increasing y (depth)" do
    assert Day02Part01.interpret(down: 2) == {0, 2}
  end

  test "interpret executes forward instruction, increasing x (horizontal position)" do
    assert Day02Part01.interpret(forward: 3) == {3, 0}
  end

  test "interpret executes all instructions" do
    assert Day02Part01.interpret(down: 2, forward: 3, up: 1) == {3, 1}
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
      5 - 3 + 8
    }

    actual = program |> Day02Part01.tokenize() |> Day02Part01.parse() |> Day02Part01.interpret()

    assert actual == expected
  end
end
