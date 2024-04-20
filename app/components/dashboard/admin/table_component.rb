# frozen_string_literal: true

class Dashboard::Admin::TableComponent < ViewComponent::Base
  def initialize(data:, header:, url_body:)
    @data = data
    @header = header
    @url_body = url_body
  end
end
