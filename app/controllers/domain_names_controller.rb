class DomainNamesController < ApplicationController
  layout 'dashboard'

  # POST /domain_names
  def create
    @name = NameDotCom.new
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
    @name = NameDotCom.new
    results = @name.search(params[:keyword], [params[:tld]])
    render json: results
  end
end
