defmodule SpacestoreWeb.AccountsResolver do
  alias Spacestore.Account
  alias SpacestoreWeb.Auth.Guardian

  def create_user(params, _info) do
    Account.create_user(params)
  end

  def login(%{email: email, password: password} = credential, _info) do
    with {:ok, user} <- Account.validate_user_login(credential),
      {:ok, jwt, _} <- Guardian.encode_and_sign(user),
      {:ok, _ } <- Account.store_token(user, jwt)
    do
      {:ok, %{token: jwt}}
    end
  end

  def test(args, %{context: %{current_user: current_user}}) do
    current_user
  end
  
  def test(_args, _info) do
    {:error, "Not Authorized"}
  end
end