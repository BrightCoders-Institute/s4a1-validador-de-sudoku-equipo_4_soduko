# frozen_string_literal: false

require_relative 'resolver'

# class for row
class Row < Resolver
  # check every position of the row of top to down if there is repeated numbers
  def check_vertical
    result = []

    9.times do |column_index|
      column = []

      @tablero.each do |row|
        column << row[column_index]
      end

      result << column
    end
    true?(result) ? true : false
  end

  def true?(vertical)
    vertical.each do |row|
      row.each do |number|
        return false if row.count(number) > 1 && number.positive?
      end
    end
  end

  # check by column if there is a repeated number
  def check_column
    @tablero.each do |row|
      row.each do |number|
        return false if row.count(number) > 1 && number.positive?
      end
    end
  end
end
