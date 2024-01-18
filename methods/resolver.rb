# frozen_string_literal: false

require_relative 'display'

# class for resolver
class Resolver < Display
  # fill row whithout repeat number
  def validate
    @tablero.each_with_index do |row, idx|
      @tablero[idx] = change_number(row)
    end
    @tablero
  end

  def change_number(row)
    # return unless check_column
    row.each_with_index do |number, idx|
      num_rand = rand(1..9)
      row[idx] = num_rand if number.zero? && row.count(num_rand) < 1 && check_column
    end
  end
end
