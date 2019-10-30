# frozen_string_literal: true

module Helpers
  def map_move_to_x_y(move)
    case move
    # first row
    when 1
      { 'x' => 0, 'y' => 0 }
    when 2
      { 'x' => 0, 'y' => 1 }
    when 3
      { 'x' => 0, 'y' => 2 }
    # second row
    when 4
      { 'x' => 1, 'y' => 0 }
    when 5
      { 'x' => 1, 'y' => 1 }
    when 6
      { 'x' => 1, 'y' => 2 }
    # second row
    when 7
      { 'x' => 2, 'y' => 0 }
    when 8
      { 'x' => 2, 'y' => 1 }
    when 9
      { 'x' => 2, 'y' => 2 }
    end
  end
end
