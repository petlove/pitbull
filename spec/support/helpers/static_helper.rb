# frozen_string_literal: true

module StaticHelper
  def static_authorize(token = Pitbull.static.token)
    request.headers[Pitbull.static.header] = token || Pitbull.static.token
  end
end
