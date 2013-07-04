class Subdomain
  def self.matches?(request)
    if request.domain && request.domain.starts_with?('amplifyre')
      case request.subdomain
      when 'www', '', 'amplifyre', nil
        false
      else
        true
      end
    else
      true
    end
  end
end
