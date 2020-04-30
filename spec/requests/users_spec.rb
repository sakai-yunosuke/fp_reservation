require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe 'GET /signup' do
    it { is_expected.to eq(200) }
  end

end
