defmodule MatasanoTest do
  use ExUnit.Case, async: true
  doctest Matasano

  test "Convert Hex base 16 to base 64" do
    hex = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    base64 = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    assert Matasano.hex_to_base64(hex) == base64
  end

  test "Fixed XOR two strings" do
    # a = "1c0111001f010100061a024b53535009181c"
    # b = "686974207468652062756c6c277320657965"
    # result = "746865206b696420646f6e277420706c6179"
    a = "abab"
    b = "baba"
    result = "ababa"
    assert Matasano.fixed_xor(a,b,"") == result
  end
end
