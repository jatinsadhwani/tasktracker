defmodule TasktrackerWeb.SessionController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Accounts

  def create(conn, %{"email" => email}) do
    user = Accounts.get_user_by_email(email)
    if user do
      conn
      |>put_session(:user_id,user.id)
      |>put_flash(:info, "Welcome, #{user.name}")
      |>redirect(to: page_path(conn, :task))
    else
      conn
      |> put_flash(:error, "Session Creation Error! User does not exist!")
      |> redirect(to: page_path(conn, :index))
    end
  end

    def delete(conn, _params) do
      conn
      |>delete_session(:user_id)
      |>put_flash(:info, "You have logged out!")
      |>redirect(to: page_path(conn, :index))
    end

  end
