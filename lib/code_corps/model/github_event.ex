defmodule CodeCorps.GithubEvent do
  use CodeCorps.Model
  use Scrivener, page_size: 20

  @type t :: %__MODULE__{}

  schema "github_events" do
    field :action, :string
    field :failure_reason, :string
    field :github_delivery_id, :string
    field :payload, :map
    field :status, :string
    field :type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:action, :github_delivery_id, :payload, :status, :type])
    |> validate_required([:action, :github_delivery_id, :payload, :status, :type])
  end
end
