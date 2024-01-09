defmodule OpenAI.Threads do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/threads"

  def url(), do: Config.base_url() <> @path
  def url(thread_id), do: Config.base_url() <> "#{@path}/#{thread_id}"
  def runs_url(), do: Config.base_url() <> "#{@path}/runs"

  def fetch(params, config \\ %Config{}) do
    url()
    |> Client.api_get(params, config)
  end

  def fetch_by_id(thread_id, config \\ %Config{}) do
    url(thread_id)
    |> Client.api_get(config)
  end

  def create(params, config \\ %Config{}) do
    url()
    |> Client.api_post(params, config)
  end

  def update(thread_id, params, config \\ %Config{}) do
    url(thread_id)
    |> Client.api_post(params, config)
  end

  def delete(thread_id, config \\ %Config{}) do
    url(thread_id)
    |> Client.api_delete(config)
  end

  def create_and_run(params, config \\ %Config{}) do
    runs_url()
    |> Client.api_post(params, config)
  end
end
