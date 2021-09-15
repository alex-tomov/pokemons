# frozen_string_literal: true

class PokemonService < BaseService
  def get_items(page = 1)
    call_api('pokemon', page)
  end
end
