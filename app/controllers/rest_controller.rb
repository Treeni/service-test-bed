require 'csv'
class RestController < ApplicationController
  http_basic_authenticate_with name: "a", password: "a"#, except: :index

  def index
    file_name = params["file"]
    file_name = file_name ||= 'data.csv'
    file_path = Rails.root.join('public', 'csv', file_name)

    data = CSV.open(file_path, headers: true, header_converters: :symbol, converters: :all).to_a.map(&:to_hash).to_json

    render json: data
  end

  private

  def permitted_params
    params.require(:user).permit(:id, :name)
  end

  def doc_not_found
    render json: { errors: ['Document Not Found'] }, status: :not_found
  end
end