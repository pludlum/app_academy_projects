class Array

  def my_uniq
    result = []

    each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []

    each_index do |idx1|
      j = idx1 + 1
      next if j == length

      (j...length).each do |idx2|
        if self[idx1] + self[idx2] == 0
          result << [idx1, idx2]
        end
      end
    end
    result
  end

  def my_transpose
    p self
    result = []
    self.each_with_index do |row,row_idx|  
      temp = []
      row.each_with_index do |col, col_idx|
        temp << self[col_idx][row_idx]
      end
      result << temp
    end
    result
  end

end
