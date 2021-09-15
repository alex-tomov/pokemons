# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypeService do
  subject { described_class.new.get_items }
  # rubocop:disable Layout/LineLength
  let(:body_response) { "{\"count\":20,\"next_url\":null,\"previous_url\":null,\"results\":[{\"name\":\"normal\",\"url\":\"https://pokeapi.co/api/v2/type/1/\"}]}" }
  # rubocop:enable Layout/LineLength
  it 'returns data' do
    stub_request(:get, 'https://pokeapi.co/api/v2/type/?limit=50&offset=0')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'pokeapi.co',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: body_response, headers: {})

    expect(subject.results).to be_a Array
    expect(subject.results.first).to respond_to(:name)
  end
end
