Application.ensure_all_started :hound

# todo: run phantomjs --wd

defmodule Xtr do
  use Hound.Helpers

  def run do
    Hound.start_session
    navigate_to "http://translate.google.pl/#en/pl/foo"
    IO.puts page_title

    Hound.end_session
  end
end

Xtr.run
