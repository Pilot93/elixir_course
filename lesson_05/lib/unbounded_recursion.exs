defmodule UnboundedRecursion do

  def browse(path) do
    IO.puts(path)
    if File.dir?(path) do
      {:ok, items} = File.ls(path)
      Enum.each(items, fn item -> browse(Path.join(path, item)) end)
    end
  end


  def tree(path) do
    tree(path, 0)
  end

  defp tree(path, depth) do
    Path.basename(path)
    |> make_padding(depth)
    |> IO.puts()
    if File.dir?(path) do
      {:ok, items} = File.ls(path)
      Enum.each(items, fn item -> tree(Path.join(path, item), depth + 1) end)
    end
  end

  defp make_padding(str, depth) do
    String.duplicate("|--", depth) <> str
  end

end
