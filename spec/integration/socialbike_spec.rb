require 'swagger_helper'

describe 'Socialbike API' do


  path '/auth/login' do

    post 'Autenticarse en la aplicación' do
      tags 'Authenticate User'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
        },
        required: [ 'username', 'password']

      }

      response '201', 'AuthenticateUser created' do
        let(:Authorization) { "Bearer #{::UserToken.encode(user)}" }
        let(:user) { { nombre: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end

  end

  path '/events' do

    post 'Crear un Evento' do
      tags 'Events'
      consumes 'application/json'

      parameter name: :event, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          nombre: { type: :string },
          sitio_encuentro: { type: :string },
          fecha: { type: :string }
        },
        required: [ 'user_id', 'nombre', 'sitio_encuentro', 'fecha']

      }

      response '201', 'Event created' do
        let(:event) { { nombre: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:event) { { name: 'foo' } }
        run_test!
      end

    end

  end
  
end