# frozen_string_literal: true

module StaticAuthenticationHelper
  def static_authenticate(token = Pitbull.static.token)
    request.headers[Pitbull.static.header] = token || Pitbull.static.token
  end
end
