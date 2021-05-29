require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder

  def self.valid_moves(pos)
    r,c=pos
    moves=[]
    # i=1
    # j=2
    #  while i<=2
    #         new_r1=r-row_idx
    #         new_c1=c-col_idx
    #         new_r2=r+row_idx
    #         new_c2=c+col_idx
    #         if new_r1>0 && new_r2<8
    #             if new_c1>0 && new_c2<8
    #                 moves<<[new_r1,new_c1]
            


    r_1=r-1
    r_2=r+1
    r_3=r-2
    r_4=r+2

    c_1=c-1
    c_2=c+1
    c_3=c-2
    c_4=c+2
    
    moves<<[r_1,c_3]
    moves<<[r_1,c_4]
    moves<<[r_2,c_3]
    moves<<[r_2,c_4]
    moves<<[r_3,c_1]
    moves<<[r_3,c_2]
    moves<<[r_4,c_1]
    moves<<[r_4,c_2]

    moves.select do |position|
        position[0]>=0 && position[0]<8
        position[1]>=0 && position[1]<8
    end

    moves

  end
 
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions=[pos]
  end


end