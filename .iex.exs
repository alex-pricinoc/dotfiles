IEx.configure(
  colors: [
    eval_info: [:yellow, :bright],
    eval_error: [:red],
    eval_interrupt: [:red],
    stack_info: [:blue],
    doc_code: [:blue],
    doc_inline_code: [:blue],
    doc_headings: [:red, :bright]
  ],
  width: 100,
  inspect: [
    pretty: true,
    width: 80,
    charlists: :as_lists,
    limit: :infinity,
    printable_limit: 2048
  ],
  default_prompt:
    [
      "\e[G",
      :blue,
      :bright,
      "%prefix(%counter)>"
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)

defmodule H do
  def state(pid) when is_binary(pid), do: pid(pid) |> state
  def state(pid) when is_pid(pid), do: :sys.get_state(pid)

  def benchmark(function) do
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1000)
    |> then(& "#{&1}ms")
  end

  def copy(term) do
    text =
      if is_binary(term) do
        term
      else
        inspect(term, limit: :infinity, pretty: true)
      end

    port = Port.open({:spawn, "wl-copy"}, [])
    true = Port.command(port, text)
    true = Port.close(port)

    :ok
  end

  if Code.ensure_loaded?(Repo) do
    import_if_available(Ecto)
    import_if_available(Ecto.Changeset)
    import_if_available(Ecto.Query, only: [from: 1, from: 2])

    def all(model, preload \\ []), do: Repo.all(model) |> Repo.preload(preload)
    def get(model, id, preload \\ []), do: Repo.get(model, id) |> Repo.preload(preload)

    def update(model, id, attrs \\ %{}) do
      Repo.update(Ecto.Changeset.change(Repo.get(model, id), attrs))
    end

    def delete(model, id), do: Repo.delete(get(model, id))
  end
end

defmodule Mex do
  defp expand_all(n, env) do
    Macro.prewalk(n, &Macro.expand(&1, env))
  end

  defmacro mex(do: block) do
    block
    |> expand_all(__CALLER__)
    |> Macro.to_string
    |> IO.puts

    quote do: :ok
  end
end

# User switch command
# ctrl + g, h
# Auto close brackets
# ctrl + ]
