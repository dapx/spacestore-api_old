# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Spacestore.Repo.insert!(%Spacestore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Spacestore.Account.User
alias Spacestore.Business.Store
%User{
  email: "dap1995@gmail.com",
  password: "123321",
  is_verified: true,
  name: "Daniel"
} |> Spacestore.Repo.insert!
owner = Spacestore.Repo.get_by(User, email: "dap1995@gmail.com")
%Store{
  name: "Teste",
  email: "dap1995@gmail.com",
  description: "Loja de teste",
  document: "09245476936",
  owner: owner,
} |> Spacestore.Repo.insert!