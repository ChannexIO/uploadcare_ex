defmodule UploadcareEx.Server do
  use GenServer
  alias UploadcareEx.Impl

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call({:upload_url, url}, _, state) do
    result = url |> Impl.upload_url()

    {:reply, result, state}
  end
end
