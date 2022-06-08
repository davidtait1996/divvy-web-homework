# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

  Faker.start()

  alias Homework.Repo
  alias Homework.Merchants
  alias Homework.Users
  alias Homework.Companies
  alias Homework.Transactions

  Repo.delete_all Merchants.Merchant
  Repo.delete_all Users.User
  Repo.delete_all Companies.Company
  Repo.delete_all Transactions.Transaction

  merchant1 = Merchants.create_merchant(%{description: Faker.Company.bs(), name: Faker.Company.name()}) |> elem(1);
  merchant2 = Merchants.create_merchant(%{description: Faker.Company.bs(), name: Faker.Company.name()}) |> elem(1);
  merchant3 = Merchants.create_merchant(%{description: Faker.Company.bs(), name: Faker.Company.name()}) |> elem(1);
  merchant4 = Merchants.create_merchant(%{description: Faker.Company.bs(), name: Faker.Company.name()}) |> elem(1);
  merchant5 = Merchants.create_merchant(%{description: Faker.Company.bs(), name: Faker.Company.name()}) |> elem(1);

  company1 = Companies.create_company(%{name: Faker.Company.name(), credit_line: 10000}) |> elem(1)
  company2 = Companies.create_company(%{name: Faker.Company.name(), credit_line: 5000}) |> elem(1)

  user1 = Users.create_user(%{dob: to_string(Faker.Date.date_of_birth(18..75)), first_name: Faker.Person.first_name(), last_name: Faker.Person.last_name(), company_id: company1.id}) |> elem(1);
  user2 = Users.create_user(%{dob: to_string(Faker.Date.date_of_birth(18..75)), first_name: Faker.Person.first_name(), last_name: Faker.Person.last_name(), company_id: company1.id}) |> elem(1);
  user3 = Users.create_user(%{dob: to_string(Faker.Date.date_of_birth(18..75)), first_name: Faker.Person.first_name(), last_name: Faker.Person.last_name(), company_id: company2.id}) |> elem(1);
  user4 = Users.create_user(%{dob: to_string(Faker.Date.date_of_birth(18..75)), first_name: Faker.Person.first_name(), last_name: Faker.Person.last_name(), company_id: company2.id}) |> elem(1);
  user5 = Users.create_user(%{dob: to_string(Faker.Date.date_of_birth(18..75)), first_name: Faker.Person.first_name(), last_name: Faker.Person.last_name(), company_id: company2.id}) |> elem(1);

  transaction_group = [%{amount: Faker.random_between(1,10000), credit: true, debit: false, description: Faker.Food.description(), user_id: user1.id, merchant_id: merchant1.id},
                       %{amount: Faker.random_between(1,10000), credit: true, debit: false, description: Faker.Food.description(), user_id: user2.id, merchant_id: merchant2.id},
                       %{amount: Faker.random_between(1,10000), credit: false, debit: true, description: Faker.Food.description(), user_id: user3.id, merchant_id: merchant3.id},
                       %{amount: Faker.random_between(1,10000), credit: false, debit: true, description: Faker.Food.description(), user_id: user4.id, merchant_id: merchant4.id},
                       %{amount: Faker.random_between(1,10000), credit: true, debit: false, description: Faker.Food.description(), user_id: user5.id, merchant_id: merchant5.id}]
  
  Enum.each(transaction_group, fn(transaction) -> 
    Transactions.create_transaction(transaction)
  end)