defmodule OpenAI.Completions do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/completions"
  @engines_path "/engines"

  def url(), do: Config.base_url() <> @path
  def deprecated_url(engine_id), do: Config.base_url() <> "#{@engines_path}/#{engine_id}/completions"

  def fetch(params, config \\ %Config{}) do
    url()
    |> Client.api_post(params, config)
  end

  def fetch_by_engine(engine_id, params, config \\ %Config{}) do
    deprecated_url(engine_id)
    |> Client.api_post(params, config)
  end
end
