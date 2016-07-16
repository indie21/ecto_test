defmodule :release_tasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:ecto_test)

    path = Application.app_dir(:ecto_test, "priv/repo/migrations")

    Ecto.Migrator.run(EctoTest.Repo, path, :up, all: true)

    :init.stop()
  end
end
