class UserMailer < ApplicationMailer
  default from: 'notifications@zaggle.com'
 
  def report_email
    @user = params[:user]
    @file_name = params[:file_name]
    mail(to: @user.email, subject: 'Transactions Report Download Link')
  end
end
