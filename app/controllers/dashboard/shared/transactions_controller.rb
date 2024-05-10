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
      return_url: 'http://localhost:3000'
    }
    @request = HTTParty.post('https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions',
                             body: data.to_json,
                             headers: { 'Content-Type' => 'application/json', 'Tbk-Api-Key-Id' => '597055555532',
                                        'Tbk-Api-Key-Secret' => '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C' })
    redirect_to "/dashboard/shared/transactions/execute_transbank?key=#{@request['token']}"
  end

  def execute_transbank
    @key = params[:key]
  end
end
