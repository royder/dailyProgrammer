# easy_203 The Start of Something
# http://www.reddit.com/r/dailyprogrammer/comments/2ww3pl/2015223_challenge_203_easy_the_start_of_something/

=begin
GOAL: 
On your screen, display a square.
You may use any libraries available to you.
The square may be of any size and of any colour.
=end

require 'gosu' # https://github.com/jlnr/gosu

class Window < Gosu::Window
  def initialize
    super 400, 400, false
	self.caption = 'Square'
  end

  def draw
    color = Gosu::Color.argb(0xffff0000)
    draw_line(100, 100, color, 100, 300, color)
	draw_line(100, 300, color, 300, 300, color)
	draw_line(300, 300, color, 300, 100, color)
	draw_line(300, 100, color, 100, 100, color)
  end
end

window = Window.new
window.show