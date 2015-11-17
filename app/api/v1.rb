module V1
  class Base < Grape::API
    version 'v1', using: :accept_version_header

    # Modules
    include API::Defaults
    include API::Authentication
    include API::Errors



    # Endpoints
    # mount V1::Users



    # Root
    desc 'EconLab'
    get '/' do
      content_type 'text/plain'
      body         'EconLab API'
    end


    # 404
    route :any, '*path' do
      error! 'Endpoint not found', 404
    end
  end
end
