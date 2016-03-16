defmodule Table do
  def render(list_of_issues) do
    render_headers
    render_line
    render_issues(list_of_issues)
    render_line
  end

  def render_headers do
    IO.puts " #        | created_at           | title"
  end

  def render_line do
    IO.puts String.duplicate("-", 60)
  end

  def render_issues([]), do: ""
  def render_issues([issue | tail]) do
    id         = format_id(issue)
    created_at = issue["created_at"]
    title      = issue["title"]

    IO.puts "#{id} | #{created_at} | #{title}"

    render_issues(tail)
  end

  def format_id(issue) do
    issue["id"]
    |> Integer.to_string
    |> String.rjust(9)
  end
end
