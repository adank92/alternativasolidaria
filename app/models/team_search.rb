class TeamSearch
  include ActiveModel::Model
  attr_accessor :drop_off_date, :pick_up_date, :text, :page

  def execute
    Team.by_drop_off_date(drop_off_date).by_pick_up_date(pick_up_date).like_name(text)
  end
end
