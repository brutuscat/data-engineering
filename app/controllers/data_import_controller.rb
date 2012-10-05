class DataImportController < ApplicationController
  def purchases
    input_io = params[:input]
    if input_io.present?
      @total = 0
      CSV.new(input_io.tempfile, :col_sep => "\t", :headers => true).each do |row|
        @total += Purchase.import(*row.fields).total
      end
    end
  end
end
