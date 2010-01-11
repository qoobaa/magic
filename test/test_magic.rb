require 'helper'

class TestMagic < Test::Unit::TestCase
  def test_guess_magic_text_mime
    assert_equal "text/plain; charset=utf-8", Magic.guess_file_mime(fixture("magic.txt"))
  end

  def test_guess_magic_text_mime_type
    assert_equal "text/plain", Magic.guess_file_mime_type(fixture("magic.txt"))
  end

  def test_guess_magic_text_mime_encoding
    assert_equal "utf-8", Magic.guess_file_mime_encoding(fixture("magic.txt"))
  end

  def test_guess_magic_logo_mime
    assert_equal "image/jpeg; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"))
  end

  def test_guess_magic_logo_mime_type
    assert_equal "image/jpeg", Magic.guess_file_mime_type(fixture("filelogo.jpg"))
  end

  def test_guess_magic_logo_mime_encoding
    assert_equal "binary", Magic.guess_file_mime_encoding(fixture("filelogo.jpg"))
  end

  def test_guess_non_existing_file_mime
    assert_raises Magic::Exception do
      Magic.guess_file_mime(fixture("non-existing.file"))
    end
  end

  def test_guess_non_existing_file_mime_type
    assert_raises Magic::Exception do
      Magic.guess_file_mime_type(fixture("non-existing.file"))
    end
  end

  def test_guess_non_existing_file_mime_encoding
    assert_raises Magic::Exception do
      Magic.guess_file_mime_encoding(fixture("non-existing.file"))
    end
  end

  def test_guess_magic_logo_mime_with_jpeg_database
    assert_equal "image/jpeg; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"), :database => fixture("magic_jpeg"))
  end

  def test_guess_magic_logo_mime_with_empty_database
    assert_equal "application/octet-stream; charset=binary", Magic.guess_file_mime(fixture("filelogo.jpg"), :database => fixture("magic_empty"))
  end

  def test_guess_with_block
    result = nil
    Magic.guess(:mime) { |db| result = db.file(fixture("filelogo.jpg")) }
    assert_equal "image/jpeg; charset=binary", result
  end
end
