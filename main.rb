# frozen_string_literal: false

# class for soduko
class Soduko
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(9) { Array.new(9, 0) }
  end

  def fill_matrix
    (0...@width).each do |i|
      (0...@height).each do |j|
        @matrix[i][j] = rand(1..9)
      end
    end
  end

  def display
    @matrix.each do |colum|
      colum.each do |block|
        print block
      end
      puts ' '
    end
  end

  def validate
    @matrix.each_with_index do |row, idx|
      @matrix[idx] = change_number(row)
    end
    @matrix
  end

  def change_number(row)
    while row
      random_num = rand(1..9)

      row.uniq

      break if row.uniq.length == 9

      row << random_num unless row.include?(random_num)
      # sleep(1)
    end
    row.uniq
  end

  # def check_vertical_no_duplicates
  #   column = []
  #   count = 0
  #   9.times do |idx|
  #     # print idx
  #     print count
  #     column << @matrix[idx][count]
  #     count += 1
  #   end
  #   print column
  # end
  def check_vertical_no_duplicates
    result = []

    9.times do |column_index|
      column = []

      @matrix.each do |row|
        column << row[column_index]
      end

      result << column
    end

    result.each do |column|
      print "#{column}\n"
    end
  end
end

a = Soduko.new(9, 9)
a.fill_matrix
# a.display
# a.validate
# puts ''
a.validate

a.display
a.check_vertical_no_duplicates
# a.display

# print a.change_number([2, 3, 4, 2, 3, 8, 6, 3, 5, 3])
