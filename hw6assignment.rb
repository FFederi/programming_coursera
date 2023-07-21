# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
    All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
               rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
               [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2]]],
               rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
               rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
               rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
               rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
               rotations([[0, 0], [-1, 0], [1, 0], [0, -1], [-1, -1]]), # exercise_first
               rotations([[0, 0], [-1, 0], [-2, 0], [1, 0], [2, 0]]), # exercise_second
               rotations([[0, 0], [-1, 0], [-1, -1]])] # exercise_third
                    
  # your enhancements here
    def self.next_piece (board)
      Piece.new(All_My_Pieces.sample, board)
    end
end

class MyBoard < Board
  # your enhancements here
  def next_piece
    super
  end
end

class MyTetris < Tetris
  # your enhancements here
 def key_bindings
    super
    @root.bind('u', proc {@board.rotate_clockwise; @board.rotate_clockwise})
 end
end
