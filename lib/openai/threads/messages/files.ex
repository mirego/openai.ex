defmodule OpenAI.Threads.Messages.Files do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @path "/threads"

  def url(thread_id, message_id), do: Config.base_url() <> "#{@path}/#{thread_id}/messages/#{message_id}/files"
  def url(thread_id, message_id, file_id), do: Config.base_url() <> "#{@path}/#{thread_id}/messages/#{message_id}/files/#{file_id}"

  def fetch(thread_id, message_id, params \\ [], config \\ %Config{}) do
    url(thread_id, message_id)
    |> Client.api_get(params, config)
  end

  def fetch_by_id(thread_id, message_id, file_id, config \\ %Config{}) do
    url(thread_id, message_id, file_id)
    |> Client.api_get(config)
  end
end
