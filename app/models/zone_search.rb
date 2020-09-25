class ZoneSearch
  include ActiveModel::Model
  attr_accessor :text, :page

  def execute
    Zone.search(text)
  end
end
