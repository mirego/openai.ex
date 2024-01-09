defmodule OpenAI.Embeddings do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/embeddings"

  def url(), do: Config.base_url() <> @path

  def fetch(params, config \\ %Config{}) do
    url()
    |> Client.api_post(params, config)
  end
end
