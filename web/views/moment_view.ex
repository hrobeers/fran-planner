defmodule FranAppBackend.MomentView do
  use FranAppBackend.Web, :view

  def render("index.json", %{moments: moments}) do
    %{moments: render_many(moments, "moment.json")}
  end

  def render("show.json", %{moment: moment}) do
    %{moment: render_one(moment, "moment.json")}
  end

  def render("moment.json", %{moment: moment}) do
    %{
         id: moment.id,
         date: moment.date,
         starttime: moment.starttime,
         endtime: moment.endtime,
         location: moment.location,
         max_count: moment.max_count
     }
  end
end
