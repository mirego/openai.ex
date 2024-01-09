defmodule OpenAI.Assistants.Files do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/assistants"

  def url(assistant_id), do: Config.base_url() <> "#{@path}/#{assistant_id}/files"
  def url(assistant_id, file_id), do: Config.base_url() <> "#{@path}/#{assistant_id}/files/#{file_id}"

  def fetch(assistant_id, params \\ [], config \\ %Config{}) do
    url(assistant_id)
    |> Client.api_get(params, config)
  end

  def fetch_by_id(assistant_id, file_id, config \\ %Config{}) do
    url(assistant_id, file_id)
    |> Client.api_get(config)
  end

  def create(assistant_id, params, config \\ %Config{}) do
    url(assistant_id)
    |> Client.api_post(params, config)
  end

  def delete(assistant_id, file_id, config \\ %Config{}) do
    url(assistant_id, file_id)
    |> Client.api_delete(config)
  end
end
