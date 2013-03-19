class NameDotCom
  include HTTParty
  base_uri APP_CONFIG['name_dot_com_base_uri']
  format :json

  class << self
    attr_accessor :username, :api_token
  end

  def initialize(username=nil, api_token=nil)
    @username = username || self.class.username || APP_CONFIG['name_dot_com_username']
    @api_token = api_token || self.class.api_token || APP_CONFIG['name_dot_com_api_token']

    self.class.headers({
      'Api-Username' => @username,
      'Api-Token' => @api_token
    })
  end

  def domain_list
    response = self.class.get('/api/domain/list').parsed_response
  end

  def search(keyword, tlds=[])
    response = self.class.post('/api/domain/check', :body => {
      :keyword => keyword,
      :tlds => tlds,
      :services => ['availability']
    }.to_json).parsed_response

    if response['result']['code'] == 100
      domains_data = response['domains']
      domains_data.keys.select do |domain|
        domains_data[domain]['avail']
      end
    else
      []
    end
  end

  def purchase(domain_name)
    response = self.class.post('/api/domain/create', :body => {
      :domain_name => domain_name,
      :period => 1
    }.to_json).parsed_response

    if response['result']['code'] == 100
      dns_responses = self.set_dns(domain_name)
      { :response => response, :dns_response => dns_responses }
    else
      { :response => response }
    end
  end

  def set_dns(domain_name)
    no_host_response = self.class.post('/api/dns/create/%s' % domain_name, :body => {
      :hostname => '',
      :type => 'CNAME',
      :content => 'amplifyre.herokuapp.com',
      :ttl => 300
    }.to_json).parsed_response

    www_response = self.class.post('/api/dns/create/%s' % domain_name, :body => {
      :hostname => 'www',
      :type => 'CNAME',
      :content => 'amplifyre.herokuapp.com',
      :ttl => 300
    }.to_json).parsed_response

    [no_host_response, www_response]
  end

end
