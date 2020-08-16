defmodule Coop.Account.UserResolver do
  alias Coop.{Account, Mailer}

  import Bamboo.Email

  def list_users(_, _, %{context: context}) do
    mail =
      new_email(
        to: "flashup4all@gmail.com",
        from: "support@myapp.com",
        subject: "Welcome to the app.",
        html_body: "<strong>Thanks for joining!</strong>",
        text_body: "Thanks for joining!"
      )
      |> Mailer.deliver_later()

    IO.puts("email")
    IO.inspect(mail)
    IO.puts("email")
    {:ok, Account.list_users()}
  end

  def create_user(_, %{user: user}, _) do
    case Account.create_user(user) do
      {:ok, _} = successful ->
        successful

      {:error, changeset} ->
        {
          :error,
          message: "Could not create  user", details: error_details(changeset)
        }
    end
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end
end
