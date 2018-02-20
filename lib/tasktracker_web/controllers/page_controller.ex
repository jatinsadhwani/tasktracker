defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Utilities
  alias Tasktracker.Utilities.Task


  def index(conn, _params) do
    render conn, "index.html"
  end

  def task(conn, _params) do
    tasks = Utilities.list_tasks()
    new_task = %Task{ time: 0}
    changeset = Utilities.change_task(new_task)
    render conn, "task.html", tasks: tasks, changeset: changeset
  end
end
