defmodule Coop.Account.UserResolver do
  alias Coop.Account

  def list_users(_, _, _) do
    {:ok, Account.list_users()}
  end

  def create_user(_, %{user: user}, _) do
    case Account.create_user(user) do
        {:ok, _} = successful -> successful
        {:error, changeset} ->
            {
                :error,
                message: "Could not create  user", details: error_details(changeset),
                }
            
    end
    
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
    end

end
