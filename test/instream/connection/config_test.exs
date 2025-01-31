defmodule Instream.Connection.ConfigTest do
  use ExUnit.Case, async: true

  alias Instream.Connection.Config

  test "otp_app configuration", %{ test: test } do
    config = [ foo: :bar, writer: Awesome.Writer.Module ]
    :ok    = Application.put_env(test, __MODULE__, config)

    expect = ([ otp_app: test ] ++ config) |> Enum.into(%{})
    actual = Config.config(test, __MODULE__) |> Enum.into(%{})

    assert expect == actual
  end

  test "missing configuration raises", %{ test: test } do
    exception = assert_raise ArgumentError, fn ->
      Config.config(test, __MODULE__)
    end

    assert String.contains?(exception.message, inspect __MODULE__)
    assert String.contains?(exception.message, inspect test)
  end
end
