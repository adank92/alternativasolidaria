module TeamsHelper
  def readable_destination(destination)
    destination.gsub("\r\n", " -- ")
  end

  def collaborator_names(collaborators)
    collaborators.map(&:name).join(", ")
  end
end
