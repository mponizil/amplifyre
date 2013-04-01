module ApplicationHelper
  def full_url(path)
    if path.starts_with?('http')
      path
    else
      request.protocol + request.host + path
    end
  end
end
