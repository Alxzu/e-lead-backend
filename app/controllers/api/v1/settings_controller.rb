class Api::V1::SettingsController < ApplicationController
  def index
    Rails.logger.info("request.host: #{request.host}, request.headers: #{request.headers['Origin']}")

    return render json: { error: "Store not found request.host: #{request.host}" }, status: 404 unless store

    Rails.logger.info("settings by store: #{request.headers['Origin']}")

    @settings = store.settings.first&.data || {}

    render json: @settings
  end

  private

  def store
    domain = request.headers["Origin"].gsub(%r{^(https?://)?(www\.)?}, "")
    Store.find_by(host_name: domain)
  end
end
