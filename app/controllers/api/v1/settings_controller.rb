class Api::V1::SettingsController < ApplicationController
  def index
    store = Store.find_by(host_name: request.headers["Origin"])

    return render json: { error: "Store not found" }, status: 404 unless store

    Rails.logger.info("settings by store: #{request.headers['Origin']}")

    @settings = store.settings.first&.data || {}

    render json: @settings
  end
end
