class MembershipPaymentDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def formated_money
    "$ #{amount}"
  end

  def formated_month
    month = start_pay.to_date.strftime('%B')
    case month
    when 'January' then 'Enero'
    when 'February' then 'Febrero'
    when 'March' then 'Marzo'
    when 'April' then 'Abril'
    when 'May' then 'Mayo'
    when 'June' then 'Junio'
    when 'July' then 'Julio'
    when 'August' then 'Agosto'
    when 'September' then 'Septiembre'
    when 'October' then 'Octubre'
    when 'November' then 'Noviembre'
    when 'December' then 'Diciembre'
    end
  end
end
