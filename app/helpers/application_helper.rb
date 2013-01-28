module ApplicationHelper
  def full_url(path)
    if path.match('http://')
      path
    else
      request.protocol + request.host + path
    end
  end
end
