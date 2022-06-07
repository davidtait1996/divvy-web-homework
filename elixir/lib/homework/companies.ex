defmodule Homework.Companies do

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Companies.Company

  def list_companies(_args) do
    Repo.all(Company)
  end

  def get_company!(id), do: Repo.get!(Company, id)
  
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end

end