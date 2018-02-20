defmodule Tasktracker.UtilitiesTest do
  use Tasktracker.DataCase

  alias Tasktracker.Utilities

  describe "tasks" do
    alias Tasktracker.Utilities.Task

    @valid_attrs %{description: "some description", status: true, time: 42, title: "some title"}
    @update_attrs %{description: "some updated description", status: false, time: 43, title: "some updated title"}
    @invalid_attrs %{description: nil, status: nil, time: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Utilities.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Utilities.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Utilities.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Utilities.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.status == true
      assert task.time == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Utilities.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Utilities.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.description == "some updated description"
      assert task.status == false
      assert task.time == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Utilities.update_task(task, @invalid_attrs)
      assert task == Utilities.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Utilities.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Utilities.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Utilities.change_task(task)
    end
  end
end
