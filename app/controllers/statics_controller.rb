class StaticsController < ApplicationController
  def prelaunch
    render :layout => false
  end

  def subscribe
    email = params[:email]

    if email.empty?
      resp = { :success => false, :error => 'Please enter an email to subscribe.' }
      render json: resp, status: :unprocessable_entity
    else
      begin
        gb = Gibbon.new
        gb.list_subscribe({:id => '02d95d2b31', :email_address => email})
        resp = { :success => true, :email => email }
        render json: resp, status: :created
      rescue Gibbon::MailChimpError => e
        if e.to_s.match(/is already subscribed to list/)
          resp = { :success => false, :error => 'The email address entered has already been subscribed.' }          
        else
          resp = { :success => false, :error => 'Something went wrong. Please try again later.' }
        end

        render json: resp, status: :unprocessable_entity
      end
    end
  end

  def home
  end

  def examples
  end
end
