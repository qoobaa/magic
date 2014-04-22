# encoding: UTF-8

require "helper"

class TestMagic < Test::Unit::TestCase
  test "guess magic.txt mime" do
    assert_equal "text/plain; charset=utf-8", Magic.guess_file_mime(fixture("magic.txt"))
  end

  test "guess magic.txt mime type" do
    assert_equal "text/plain", Magic.guess_file_mime_type(fixture("magic.txt"))
  end

  test "guess magic.txt mime encoding" do
    assert_equal "utf-8", Magic.guess_file_mime_encoding(fixture("magic.txt"))
  end

  test "guess filelogo.jpg mime" do
    assert_equal "image/jpeg; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"))
  end

  test "guess filelogo.jpg mime type" do
    assert_equal "image/jpeg", Magic.guess_file_mime_type(fixture("filelogo.jpg"))
  end

  test "guess filelogo.jpg mime encoding" do
    assert_equal "binary", Magic.guess_file_mime_encoding(fixture("filelogo.jpg"))
  end

  test "guess non-existing file mime" do
    assert_raises Magic::Exception do
      Magic.guess_file_mime(fixture("non-existing.file"))
    end
  end

  test "guess filelogo.jpg mime with magic_jpeg database" do
    assert_equal "image/jpeg; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"), :database => fixture("magic_jpeg"))
  end

  test "guess filelogo.jpg mime with empty database" do
    assert_equal "binary; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"), :database => fixture("magic_empty"))
  end

  test "guess with block" do
    result = nil
    Magic.guess(:mime) { |db| result = db.file(fixture("filelogo.jpg")) }
    assert_equal "image/jpeg; charset=binary", result
  end

  test "guess encoding from string" do
    utf8 = "utf-8".force_encoding(Encoding::ASCII_8BIT)
    assert_equal utf8, Magic.guess_string_mime_encoding('áéíóú')
  end

end
