defmodule CoopWeb.Schema.Schema do
  use Absinthe.Schema

  # alias CoopWeb.Types
  alias Coop.Account
alias CoopWeb.Schema.Middleware
  @moduledoc """
  Coop Graphql schema
  """
  # import types
  import_types(CoopWeb.Types.Type)

  query do
    @desc "get list of users"
    field :users, list_of(:user_type) do
        middleware(Middleware.Authorize, :any)
      resolve(&Account.UserResolver.list_users/3)
    end
  end

  mutation do
    @desc "create new user"

    field :create_user, type: :user_type do
      arg(:user, non_null(:user_input_type))

      resolve(&Account.UserResolver.create_user/3)
    end

    @desc "authenticate a user"
    field :authenticate, type: :session_type do
        arg(:auth, non_null(:session_input_type))
        resolve(&Account.SessionResolver.authenticate_user/3)
    end
    
  end

  # subscription do

  # end
end
