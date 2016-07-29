Application.ensure_all_started :hound

# todo: run phantomjs --wd

defmodule Xtr do
  use Hound.Helpers

  def run(words) do
    Hound.start_session
    navigate_to "http://translate.google.pl/#en/pl/"
    find_element(:id, "gt-otf-switch") |> click
    s = find_element(:id, "source")
    c = find_element(:id, "gt-submit")
    r = find_element(:id, "result_box")
    fill_field(s, words)
    c |> click
    wait_for_text(r, 50) |> IO.puts 
    Hound.end_session
  end

  def wait_for_text(element, sleep_ms) do
    result = inner_text(element) |> to_string
    if result == "" do
      :timer.sleep(sleep_ms)
      wait_for_text(element, sleep_ms)
    else
      result
    end
  end

end

Xtr.run(System.argv |> Enum.join(" "))
