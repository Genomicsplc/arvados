class Job < ArvadosBase
  def self.goes_in_folders?
    true
  end

  def attribute_editable?(attr)
    false
  end

  def self.creatable?
    false
  end

  def default_name
    if script
      x = "\"#{script}\" job"
    else
      x = super
    end
    if finished_at
      x += " finished #{finished_at.strftime('%b %-d')}"
    elsif started_at
      x += " started #{started_at.strftime('%b %-d')}"
    elsif created_at
      x += " submitted #{created_at.strftime('%b %-d')}"
    end
  end
end
