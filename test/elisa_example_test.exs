defmodule ElisaExampleTest do
  use ExUnit.Case
  doctest ElisaExample

  test "greets the world" do
    assert ElisaExample.hello() == :world
  end
end
