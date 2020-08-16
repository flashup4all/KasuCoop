defmodule Coop.Account.SessionResolver do
  alias Coop.{Account, Guardian}

  def authenticate_user(_, %{auth: auth_input}, _) do
    with {:ok, user} <- Account.Session.authenticate(auth_input),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: token, user: user}}
    end
  end
end
