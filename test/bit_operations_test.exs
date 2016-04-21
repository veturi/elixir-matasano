defmodule MatasanoTest.BitOperations do
  use ExUnit.Case, async: true
  require Matasano.BitOperations
  doctest Matasano

  test "string xor arguments must be of same byte length" do
    assert {:error, _} = Matasano.BitOperations.string_xor "abc", "öäå"
  end

  test "string xor arguments must be valid base16 hex strings" do
    validHex = "AA16BA"
    invalidHex = "AABBYY"

    catch_error(Matasano.BitOperations.string_xor(validHex, invalidHex))
    catch_error(Matasano.BitOperations.string_xor(validHex, invalidHex))
  end

  test "string xor works as expected" do
    a = "1c0111001f010100061a024b53535009181c"
    b = "686974207468652062756c6c277320657965"
    result = "746865206b696420646f6e277420706c6179"

    assert Matasano.BitOperations.string_xor(a, b) === result
  end
end
