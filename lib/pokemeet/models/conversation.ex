defmodule Pokemeet.Conversation do
  use Pokemeet.Model

  alias Pokemeet.{Message, User}

  schema "conversations" do
    field :title, :string

    has_many :messages, Message
    many_to_many :users, User, join_through: "conversation_users"

    timestamps()
  end

    def changeset(conversation, attrs) do
      conversation
      |> cast(attrs, [:title, :updated_at])
      |> validate_required([:title])
    end
  end
