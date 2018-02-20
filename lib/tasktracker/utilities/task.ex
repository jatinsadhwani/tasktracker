defmodule Tasktracker.Utilities.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Utilities.Task


  schema "tasks" do
    field :description, :string
    field :status, :boolean, default: false
    field :time, :integer
    field :title, :string
    belongs_to :user, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :time, :user_id])
    |> validate_required([:title, :description, :status, :time, :user_id])
  end
end
