defmodule CoopWeb.Schema.Schema do
  use Absinthe.Schema

  # alias CoopWeb.Types
  alias Coop.Account.UserResolver

  @moduledoc """
  Coop Graphql schema
  """
  # import types
  import_types(CoopWeb.Types.Type)

  query do
    @desc "get list of users"
    field :users, list_of(:user_type) do
      resolve(&UserResolver.list_users/3)
    end
  end

  mutation do
    @desc "create new user"

    field :create_user, type: :user_type do
      arg(:input, non_null(:user_input_type))

      resolve(&UserResolver.create_user/3)
    end

    @desc "update user account"

    field :update_user_profile, type: :user_type do
      arg(:input, non_null(:user_input_type))  
      arg(:id, non_null(:user_input_type))  
    end
  end

  # subscription do

  # end
end
