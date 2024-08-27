class Api::V1::SettingsController < ApplicationController
  def index
    store = Store.find_by(identification: params[:store_identification])

    return render json: { error: "Store not found" }, status: 404 unless store

    @settings = store.settings.first&.data || {}

    render json: @settings
  end
end
