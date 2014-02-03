module ApplicationHelper
  def current_section_id
    id = params[:id] || params[:section_id]
    id.to_i
  end
end
