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
    @matrix.each do |row|
      print change_number(row)
    end
  end

  def change_number(row)
    # row.map! do |_current|
    #   new_number = rand(1..9)

    #   new_number = rand(1..9) while row.include?(new_number)
    #   new_number
    # end
    # row
    # count = 0
    row.each_with_index do |number, idx|
      f = rand(1..9) if number == row[idx + 1]
      row[idx] = f
    end
    row
  end
end

a = Soduko.new(9, 9)
a.fill_matrix
a.display
a.validate
