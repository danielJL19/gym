class Dashboard::Shared::TransactionsController < ApplicationController
  def initialize
    puts 'SE HA INSTANCIADO ESTE CONTROLADOR O CLASE'
  end

  def index
    redirect_to root_path
  end

  def create_transbank
    data = {
      buy_order: "ORDER_#{rand(10_000..100_000)}-#{params[:user_id]}",
      session_id: SecureRandom.hex,
      amount: params[:amount],
      return_url: "http://localhost:3000/dashboard/shared/transactions/#{params[:user_id]}/response_transbank?month=#{params[:membership_id]}"
    }
    @request = HTTParty.post('https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions',
                             body: data.to_json,
                             headers: { 'Content-Type' => 'application/json', 'Tbk-Api-Key-Id' => '597055555532',
                                        'Tbk-Api-Key-Secret' => '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C' })
    redirect_to "/dashboard/shared/transactions/execute_transbank?key=#{@request['token']}"
  end

  def execute_transbank
    @key = params[:key]
    render layout: 'dashboard_layout'
  end

  def response_transbank
    @response = HTTParty.put("https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions/#{params[:token_ws]}",
                             headers: { 'Content-Type' => 'application/json', 'Tbk-Api-Key-Id' => '597055555532',
                                        'Tbk-Api-Key-Secret' => '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C' })
    response_parsed = JSON.parse @response.body.gsub('=>', ':')
    if response_parsed['vci'] == 'TSY' && response_parsed['status'] == 'AUTHORIZED'
      @sale_membership = SaleMembership.new(amount: response_parsed['amount'], status: response_parsed['status'], buy_order: response_parsed['buy_order'], session_id: response_parsed['session_id'], transaction_date: response_parsed['transaction_date'], user_id: params[:id],
                                            membership_payment_id: params[:month])

      @message = if @sale_membership.save
                   'Se guardo'
                 else
                   @sale_membership.errors.full_messages
                 end
      render layout: 'dashboard_layout'
    else
      redirect_to dashboard_admin_membership_payments_path(id: params[:id])
    end
  end
end
