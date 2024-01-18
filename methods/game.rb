# frozen_string_literal: false

require_relative 'check_row'

# class for soduko
class Soduko < Row
  attr_accessor :tablero

  def initialize(tablero)
    super
    @tablero = tablero
  end

  # print if game is valid
  def check_print
    column = check_column ? true : false
    print "#{check_vertical && column} \n"
    check_vertical && column
  end
end
