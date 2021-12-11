defmodule Entrypoint do
  require Logger

  def main(_args \\ []) do
    Logger.info("Day 01, part 1: #{Day01Part01.answer()}")
    Logger.info("Day 01, part 2: #{Day01Part02.answer()}")
    Logger.info("Day 02, part 1: #{Day02Part01.answer()}")
    Logger.info("Day 02, part 2: #{Day02Part02.answer()}")
  end
end
