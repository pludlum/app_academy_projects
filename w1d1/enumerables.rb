require 'pry'

class Array
  def my_each(&block)
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
    self
  end


  def my_select(&block)
    new_arr = []
    my_each { |e| new_arr << e if block.call(e) == true }
    new_arr
  end

  def my_reject(&block)
    new_arr = my_select(&block)
    self - new_arr
  end

  def my_any?(&block)
    my_select(&block).length > 0
  end

  def my_all?(&block)
    my_select(&block).length == length
  end

  def my_flatten
    new_arr = []
    my_each do |e|
      unless e.is_a?(Array)
        new_arr << e
      else
        new_arr.concat(e.my_flatten)
      end
    end
    new_arr
  end

  def my_zip(*args)
    results = []
    args_num = args.length

    each.with_index do |e, idx|
      results << [e]
      args.each do |c|
        results[idx] << c[idx]

      end
    end
    results
  end

  def my_rotate(shift = 1)
    shift = shift % self.length
    self[shift...self.length] + self[0...shift]
  end

  def my_join(sep = "")
    result = ""
    self.each_with_index do |e,idx|
      result << e
      if idx < self.length - 1
        result << sep
      end
    end
    result
  end

  def my_reverse
    result = []
    each do |e|
      result.unshift(e)
    end
    result
  end

  def bubble_sort!(&proc)
    proc ||= Proc.new { |num1, num2| num1 <=> num2 }
    flag = true
    while flag
      flag = false
      (0...self.length-1).each do |i|
        i2 = i+1
        if proc.call(self[i], self[i2]) > 0
          self[i], self[i2] = self[i2], self[i]
          flag = true
        end
      end
    end
    self
  end

  def bubble_sort(&proc)
    proc ||= Proc.new { |num1, num2| num1 <=> num2 }
    result = self.dup
    flag = true
    while flag
      flag = false
      (0...result.length-1).each do |i|
        i2 = i+1
        if proc.call(result[i], result[i2]) > 0
          result[i], result[i2] = result[i2], result[i]
          flag = true
        end
      end
    end
    result
  end
end


def factors(num)
  results = []
  (1..num).each do |n|
    results << n if num % n == 0
  end
  results
end

def substrings(string)
  result = []
  (1..string.length).each do |i|
    string.chars.each_cons(i) do |a|
      result << a.join
    end
  end
  result
end

def subwords(word, dictionary)
  subs = substrings(word)
  subs.select { |word| dictionary.include?(word)}
end




binding.pry
