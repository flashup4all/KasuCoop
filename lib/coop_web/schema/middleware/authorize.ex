defmodule CoopWeb.Schema.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, role) do
    with %{current_user: current_user} <- resolution.context,
         true <- current_role?(current_user, role) do
      resolution
    else
      _ -> resolution |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end

  defp current_role?(%{}, :any), do: true
  defp current_role?(%{role: role}, role), do: true
  defp current_role?(_, _), do: false
end
