class DomainNamesController < ApplicationController
  before_filter :init_name_dot_com
  layout 'dashboard'

  # POST /domain_names
  def create
    purchase = @name.purchase(params[:domain_name])

    if purchase[:response]['result']['code'] == 100
      render json: purchase[:response]
    else
      render json: purchase[:response], status: :unprocessable_entity
    end
  end

  # DELETE /domain_names/<domain_name>
  def destroy
    head :no_content
  end

  # GET /domain_names/search
  def search
    results = @name.search(params[:keyword], [params[:tld]])
    render json: results
  end

  private

  def init_name_dot_com
    @name = NameDotCom.new('mponizil36-ote', '5e94bbf993c3d88ea756b2b30a50950e4fdfb5e3')
  end
end
