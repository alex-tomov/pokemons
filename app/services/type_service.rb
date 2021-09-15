# frozen_string_literal: true

class TypeService < BaseService
  def get_items(page = 1)
    call_api('type', page)
  end
end
