defmodule CoopWeb.Types.UserType do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :user_type do
    field :id, :id
    field :email, :string
    field :role, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :user_input_type do
    field :email, non_null(:string)
    field :password, non_null(:string)
    field :role, non_null(:string)
  end

  
end
