defmodule FranAppBackend.MomentController do
  use FranAppBackend.Web, :controller

  alias FranAppBackend.Moment

  plug :scrub_params, "moment" when action in [:create, :update]
  plug :action

  def index(conn,  %{"from_today" => _}) do
    now = Ecto.Date.local()
    moments = Repo.all(from m in Moment,
                       order_by: m.date,
                       order_by: m.starttime,
                       where: m.date >= ^now,
                       select: m)
    render(conn, "index.json", moments: moments)
  end

  def index(conn, _params) do
    moments = Repo.all(Moment)
    render(conn, "index.json", moments: moments)
  end

  def create(conn, %{"moment" => moment_params}) do
    changeset = Moment.changeset(%Moment{}, moment_params)

    if changeset.valid? do
      moment = Repo.insert(changeset)
      render(conn, "show.json", moment: moment)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(FranAppBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    moment = Repo.get(Moment, id)
    render conn, "show.json", moment: moment
  end

  def update(conn, %{"id" => id, "moment" => moment_params}) do
    moment = Repo.get(Moment, id)
    changeset = Moment.changeset(moment, moment_params)

    if changeset.valid? do
      moment = Repo.update(changeset)
      render(conn, "show.json", moment: moment)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(FranAppBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    moment = Repo.get(Moment, id)

    moment = Repo.delete(moment)
    render(conn, "show.json", moment: moment)
  end

  def options(conn, _params) do
    conn
    |> put_status(200)
    |> text(nil)
  end
end
