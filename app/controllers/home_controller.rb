class HomeController < ApplicationController
  def show
  end

  def download_report
    send_file(
      "#{Rails.root}/storage/csv/transactions/#{params[:file_name]}",
      type: 'text/csv; charset=iso-8859-1; header=present',
      disposition: "attachment; filename=#{params[:file_name]}"
    )
  end
end
