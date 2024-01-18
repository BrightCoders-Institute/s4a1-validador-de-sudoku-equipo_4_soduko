# frozen_string_literal: false

# class for display
class Display
  def initialize(tablero)
    @tablero = tablero
  end

  # display the tablero
  def display
    @tablero.each do |colum|
      colum.each do |block|
        print "#{block} "
      end
      puts ' '
    end
  end
end
