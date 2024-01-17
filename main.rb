# frozen_string_literal: false

# class for soduko
class Soduko
  attr_accessor :width, :height, :tablero

  def initialize(width, height, tablero)
    @tablero = tablero
    @width = width
    @height = height
    @matrix = Array.new(9) { Array.new(9, 0) }
  end

  # def fill_matrix
  #   (0...@width).each do |i|
  #     (0...@height).each do |j|
  #       @matrix[i][j] = rand(1..9)
  #     end
  #   end
  # end

  # def display
  #   @matrix.each do |colum|
  #     colum.each do |block|
  #       print block
  #     end
  #     puts ' '
  #   end
  # end

  # def validate
  #   @matrix.each_with_index do |row, idx|
  #     @matrix[idx] = change_number(row)
  #   end
  #   @matrix
  # end

  # def change_number(row)
  #   while row
  #     random_num = rand(1..9)

  #     row.uniq

  #     break if row.uniq.length == 9

  #     row << random_num unless row.include?(random_num)
  #     # sleep(1)
  #   end
  #   row.uniq
  # end

  def check_column
    @tablero.each do |row|
      row.each do |number|
        return false if row.count(number) > 1 && number.positive?
      end
    end
  end

  def check_vertical
    result = []

    9.times do |column_index|
      column = []

      @tablero.each do |row|
        column << row[column_index]
      end

      result << column
    end
    # print "#{result} \n"
    true?(result) ? true : false
  end

  def true?(vertical)
    vertical.each do |row|
      row.each do |number|
        return false if row.count(number) > 1 && number.positive?
      end
    end
  end

  def check_print
    column = check_column ? true : false
    print "#{check_vertical && column} \n"
  end
end

# a.fill_matrix
# # a.display
# # a.validate
# # puts ''
# a.validate

# a.display
# a.check_vertical
# # a.display

tablero = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

# tablero = [
#   [5, 3, 0, 0, 7, 0, 0, 0, 0],
#   [6, 0, 0, 1, 9, 5, 0, 0, 0],
#   [0, 9, 8, 0, 0, 0, 0, 6, 0],
#   [8, 0, 0, 0, 6, 0, 0, 0, 3],
#   [4, 0, 0, 8, 0, 3, 0, 0, 1],
#   [7, 0, 0, 0, 2, 0, 0, 0, 6],
#   [0, 6, 0, 0, 0, 0, 2, 8, 0],
#   [0, 0, 0, 4, 1, 9, 0, 0, 5],
#   [0, 0, 0, 0, 8, 0, 9, 7, 9] # El último 9 es inválido (repetido)
# ]

a = Soduko.new(9, 9, tablero)
a.check_print
