module TeamsHelper
  def get_destinations(team)
    team.destinations.map(&:name).join(', ')
  end

  def readable_date(date)
    l(date, format: :short) if date.present?
  end

  def collaborator_names(collaborators)
    collaborators.map(&:name).join(", ")
  end
end
