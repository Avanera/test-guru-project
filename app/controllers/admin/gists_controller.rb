# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
    cookies[:original_url] = request.url
  end
end
