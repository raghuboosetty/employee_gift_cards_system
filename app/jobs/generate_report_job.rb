class GenerateReportJob < ApplicationJob

  def perform(args, user)
    keys = Export::TransactionsExport.keys
    exporter = Export::TransactionsExport.new(args.slice(*keys))
    exporter.process

    UserMailer.with(user: user, file_name: exporter.file_name).report_email.deliver_later
  end

end
