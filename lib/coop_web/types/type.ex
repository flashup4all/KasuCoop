defmodule CoopWeb.Types.Type do
  use Absinthe.Schema.Notation
  alias CoopWeb.Types

  import_types(Types.UserType)
  import_types(Types.SessionType)
end
