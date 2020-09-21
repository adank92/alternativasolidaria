module TeamsHelper
  def readable_destination(destination)
    destination&.gsub("\r\n", " -- ")
  end

  def readable_date(date)
    l(date, format: :short) if date.present?
  end

  def collaborator_names(collaborators)
    collaborators.map(&:name).join(", ")
  end
end
