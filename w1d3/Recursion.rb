def range (arg1, arg2)
  return [] if  arg2 < arg1
  return [] if arg2 == arg1

  range(arg1, arg2-1) + [arg2-1]
end

def recursive_sum(arr)
  return 0 if arr.empty?
  arr.first + recursive_sum(arr[1...arr.length])
end

def iterative(arr)
  arr.reduce(:+)
end

def expo(base,power)
  return 1 if power == 0
  return base if power == 1

  base * expo(base, power - 1)
end

def expo_2(base,power)
  return 1 if power == 0
  return base if power == 1

  smaller_ex = power/2
  odd_smaller = (power-1)/2
  expo_smaller = expo_2(base, smaller_ex)
  expo_smaller_odd = expo_2(base, odd_smaller)
  if power.even?
    expo_smaller * expo_smaller
  else
    base * expo_smaller_odd * expo_smaller_odd
  end
end

def deep_dup(arr)
  result = []
  arr.each do |n|
    if n.is_a?(Array)
      result << deep_dup(n)
    else
      result << n
    end
  end
  result
end

def fib(n)
  return [1] + fib(n-1) if n == 2
  return [1] if n == 1


  fibs = [1, 1]
  until fibs.length == n
    fibs << fibs[-1] + fibs[-2]
  end

  fib(n-1) + [fibs.last]
end

def subsets(arr)
  result = [arr]

  arr.each do |n|
    result += subsets(arr.reject{|e| e == n})
  end
  result.uniq.sort_by(&:length)
end

def permutations

end

def binary_search(arr, num)
  return nil unless arr.include?(num)
  middle = arr.length / 2
  up_down = num <=> arr[middle]

  if up_down == -1
    binary_search(arr[0,middle] ,num)
  elsif up_down == 1
    binary_search(arr[middle + 1, arr.length], num) + arr[0,middle+1].length
  else
    middle
  end
end

  def merge_sort(arr)
    return arr if arr.length == 0
    return arr if arr.length == 1

    mid = arr.length / 2
    my_sort(merge_sort(arr[0,mid]), merge_sort(arr[mid, arr.length - 1]))
  end

  def my_sort(arr1, arr2)
    result = []
    arrx = arr1.dup
    arry = arr2.dup
    x = arrx.shift
    y = arry.shift

    until result.length == arr1.length + arr2.length
      compare = x <=> y
      if compare == -1
        result << x
        x = arrx.shift
        x
      elsif compare == 0
        result << x
        result << y
        x = arrx.shift
        y = arry.shift
      elsif compare == 1
        result << y
        y = arry.shift
      else
        result << x
        result << y
        result = result + arrx + arry
        result.compact!
        break
      end
    end
    result
  end

  def greedy_make_change (amt, arr_bank)
    arr_bank.sort_by! {|b| -b}
    return [] if amt == 0

    largest_coin = 0

    arr_bank.each do |c|
      if c <= amt
        largest_coin = c
        break
      end
    end

    [largest_coin] + greedy_make_change(amt - largest_coin, arr_bank)
  end

def make_better_change(amt, arr_bank)
  outcomes = []
  arr_bank.each_index do |idx|
    outcomes << greedy_make_change(amt, arr_bank[idx, arr_bank.length])
  end
  outcomes.sort_by(&:length)[0]

end

# p greedy_make_change(14, [10,7,1])
# p greedy_make_change(14, [7,1])
# p greedy_make_change(14, [1])



 p make_better_change(14, [10, 7, 1])
