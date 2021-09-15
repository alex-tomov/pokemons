# frozen_string_literal: true

class BaseService
  def call_api(resource_name, page = 1)
    PokeApi.get("#{resource_name}": { limit: 50, page: page })
  end
end
