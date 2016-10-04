module ApplicationHelper
  def paginating?
    params.include? :page
  end
end
