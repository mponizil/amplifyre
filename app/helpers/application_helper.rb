module ApplicationHelper
  def full_url(path)
    request.protocol + request.host + path
  end
end
