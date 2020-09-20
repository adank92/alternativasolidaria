class TeamSearch
  include ActiveModel::Model
  attr_accessor :pick_up_date, :text, :page

  def execute
    Team.by_pick_up_date(pick_up_date).like_name(text)
  end
end
