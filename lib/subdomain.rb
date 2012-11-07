class Subdomain
  def self.matches?(request)
    case request.subdomain
    when 'www', '', 'amplifyre', nil
      false
    else
      true
    end
  end
end