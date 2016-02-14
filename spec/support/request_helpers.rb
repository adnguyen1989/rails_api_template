module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeadersHelpers
    def api_header(version = 1)
      request.headers['Accept'] = "v#{version}"
    end

    def api_response_format(format = Mime[:json])
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end

  module FactoryHelpers
    def create(scope: :user, trait: nil)
      FactoryGirl.create(scope, trait)
    end

    def create_prospective(scope: :user, trait: nil)
      FactoryGirl.attributes_for(scope, trait)
    end
  end
end
