# frozen_string_literal: true

require_relative '../lib/helpers'

describe 'helpers' do
  describe 'validations' do
    it 'test happy sceniro for test symbol ' do
      expect(Validations.valid_symbol(:x)).to eq(true)
    end
  end
end
