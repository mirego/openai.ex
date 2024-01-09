defmodule OpenAI.Assistants do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/assistants"

  def url(), do: Config.base_url() <> @path
  def url(assistant_id), do: Config.base_url() <> "#{@path}/#{assistant_id}"

  def fetch(params, config \\ %Config{}) do
    url()
    |> Client.api_get(params, config)
  end

  def fetch_by_id(assistant_id, config \\ %Config{}) do
    url(assistant_id)
    |> Client.api_get(config)
  end

  def create(params, config \\ %Config{}) do
    url()
    |> Client.api_post(params, config)
  end

  def update(assistant_id, params, config \\ %Config{}) do
    url(assistant_id)
    |> Client.api_post(params, config)
  end

  def delete(assistant_id, config \\ %Config{}) do
    url(assistant_id)
    |> Client.api_delete(config)
  end
end
