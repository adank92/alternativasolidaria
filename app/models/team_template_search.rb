class TeamTemplateSearch
  include ActiveModel::Model
  attr_accessor :text, :page

  def execute
    TeamTemplate.like_name(text)
  end
end
