# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
    # save current URL to use it in link Back in Questions#show
    cookies[:original_url] = request.url
  end
end
