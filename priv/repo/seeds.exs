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
alias Spacestore.Business.StoreAddress
alias Spacestore.Business.UserStore
%User{
  email: "dap1995@gmail.com",
  password: "123321",
  is_verified: true,
  name: "Daniel"
} |> Spacestore.Repo.insert!

%User{
  email: "lucas@gmail.com",
  password: "123321",
  is_verified: true,
  name: "Lucas Aurélio Moreira"
} |> Spacestore.Repo.insert!

owner = Spacestore.Repo.get_by(User, email: "dap1995@gmail.com")
IO.inspect(owner)
%Store{
  name: "Loja do Daniel",
  email: "dap1995@gmail.com",
  description: "Loja de itens macabros",
  document: "09245476936",
  owner: owner,
} |> Spacestore.Repo.insert!

%Store{
  name: "Loja do Lucas",
  email: "lucasstore@gmail.com",
  description: "Loja de itens podres",
  document: "09904116997",
  owner: owner,
} |> Spacestore.Repo.insert!

%Store{
  name: "Loja do Thalia",
  email: "thaliastore@gmail.com",
  description: "Loja de roupa feminina",
  document: "0991411612397",
  owner: owner,
} |> Spacestore.Repo.insert!

%Store{
  name: "Loja do Neto",
  email: "netolala@gmail.com",
  description: "Loja de itens de cozinha",
  document: "01904112397",
  owner: owner,
} |> Spacestore.Repo.insert!

daniel_store = Spacestore.Repo.get_by(Store, email: "dap1995@gmail.com")
lucas_store = Spacestore.Repo.get_by(Store, email: "lucasstore@gmail.com")
thalia_store = Spacestore.Repo.get_by(Store, email: "thaliastore@gmail.com")
neto_store = Spacestore.Repo.get_by(Store, email: "netolala@gmail.com")

%User{
  email: "seller@gmail.com",
  password: "123321",
  is_verified: true,
  name: "Seller"
} |> Spacestore.Repo.insert!
seller = Spacestore.Repo.get_by(User, email: "seller@gmail.com")

%UserStore{
  user_id: seller.id,
  store_id: daniel_store.id
} |> Spacestore.Repo.insert!

%StoreAddress{
  cep: 89251620,
  uf: "SC",
  city: "Jaraguá do Sul",
  neighborhood: "Centro",
  street: "Rua Prefeito Leopoldo Augusto Gerent",
  number: 575,
  complement: "Apto 101",
  latitude: -26.4898151,
  longitude: -49.0770651,
  store_id: daniel_store.id
} |> Spacestore.Repo.insert!

%StoreAddress{
  cep: 89251620,
  uf: "SC",
  city: "Jaraguá do Sul",
  neighborhood: "Centro",
  street: "Rua Prefeito Leopoldo Augusto Gerent",
  number: 575,
  complement: "Apto 101",
  latitude: -26.4938413,
  longitude: -49.0825957,
  store_id: lucas_store.id
} |> Spacestore.Repo.insert!

%StoreAddress{
  cep: 89251620,
  uf: "SC",
  city: "Jaraguá do Sul",
  neighborhood: "Centro",
  street: "Rua Prefeito Leopoldo Augusto Gerent",
  number: 575,
  complement: "Apto 101",
  latitude: -26.4702377,
  longitude: -49.113845,
  store_id: thalia_store.id
} |> Spacestore.Repo.insert!

%StoreAddress{
  cep: 89251620,
  uf: "SC",
  city: "Guaramirim",
  neighborhood: "Centro",
  street: "Rua Prefeito Leopoldo Augusto Gerent",
  number: 575,
  complement: "Apto 101",
  latitude: -26.4741643,
  longitude: -49.0015628,
  store_id: neto_store.id
} |> Spacestore.Repo.insert!
