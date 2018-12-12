# exports sources
require 'csv'

module Export
  class TransactionsExport
    attr_accessor :error, :file_path, :file_name

    def initialize(options={})
      export_path = 'storage/csv/transactions'
      @file_name = options[:file_name] || "transactions-#{Time.now.to_i}.csv"
      @file_path = [export_path, @file_name].join('/')
      
      @group_by = false
      @transactions = Transaction.all

      if options[:employee_id]
        @transactions.where(employee_id: options[:employee_id])
      end
  
      if options[:card_type_id].present?
        @transactions = @transactions.joins(card: :card_type).where("card_types.id IN (?)", options[:card_type_id])
      end
  
      date_range = FormDateRange.new(options[:duration])
      if date_range.present?
        @transactions = @transactions.where(transaction_at: date_range.time_range)
      end
  
      if options[:group_by].present?
        @group_by = true
        @transactions = @transactions.group_by { |m| m.transaction_at.beginning_of_month }
      end
    end

    def process
      if !@transactions.present?
        @error = "No Transations found"
        return false
      else
        export_csv
      end
    end

    def self.keys
      [:employee_id, :card_type_id, :duration, :group_by]
    end

    def export_csv
      columns = [
        'Employee ID', 
        'Mobile Number', 
        'Card Number', 
        'Transaction Time', 
        'Merchant Name', 
        'Transaction Amount', 
        'Tax Exempted', 
        'Transaction Status'
      ]
      
      CSV.open(@file_path, 'w+') do |csv|
        csv << columns
        if @group_by
          @transactions.each do |month, transactions|
            csv << [month.to_s(:month_and_year)]
            iterate(transactions, csv)
          end
        else
          iterate(@transactions, csv)
        end
      end
    end

    def iterate(transactions, csv)
      transactions.each do |transaction|
        csv << [ 
          transaction.employee.employee_id,
          transaction.employee.mobile_number,
          transaction.card.card_number,
          transaction.transaction_at.to_s(:human_with_12hours),
          transaction.merchant_name,
          transaction.amount,
          transaction.tax_amount,
          transaction.status
        ]
      end
    end
  end
end