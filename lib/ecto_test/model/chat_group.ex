defmodule EctoTest.Model.ChatGroup do
  @moduledoc """

  """
  use EctoTest.Model
  alias EctoTest.Model.ChatGroupUser

  schema "chat_groups" do
    field :name, :string, null: false
    has_many :chat_group_users, ChatGroupUser
    has_many :users, through: [:chat_group_users, :user]
    timestamps
  end

  @spec insert(map) :: {:ok, Schema.t} | {:error, Changeset.t}
  def insert(map) do
    Map.merge(%__MODULE__{}, map) |> Repo.insert
  end
end

