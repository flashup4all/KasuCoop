defmodule Coop.Account.Session do
    @moduledoc false

    alias Coop.Account.User
    alias Coop.Repo

    def authenticate(args) do
        user = Repo.get_by(User, email: String.downcase(args.email))
        case check_password(user, args) do
            true -> {:ok, user}
            _ -> {:error, "Invalid Credentials: Email or Password incorrect"}
                
        end
    end

    defp check_password(user, args) do
        case user do
            nil -> Comeonin.Bcrypt.dummy_checkpw()
            _ -> Comeonin.Bcrypt.checkpw(args.password, user.password_hash)     
        end
    end
end