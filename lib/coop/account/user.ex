defmodule Coop.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :role, :string
    #virtual fields
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :role])
    |> validate_required([:email, :password, :role])
    # Check that email is valid
    |> validate_format(:email, ~r/@/)
    # Check that password length is >= 8 
    |> validate_length(:password, min: 6)
    # Check that password === password_confirmation
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end
