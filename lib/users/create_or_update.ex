defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.{Agent, User}

  def call(%{name: name, email: email, cpf: cpf}) do
    User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    Agent.save(user)

    {:ok, user: user}
  end

  defp save_user({:error, _reason} = error), do: error
end
