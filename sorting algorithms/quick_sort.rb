
def pivot(array, start_index = 0, end_index = array.size - 1)
  pivot = array[start_index]
  swap_index = start_index
  start_loop = start_index + 1
  start_loop.upto(array.size - 1) do |idx|
    if pivot > array[idx]
      swap_index += 1
      array[swap_index], array[idx] = array[idx], array[swap_index]
    end
    p array
  end
  array[start_index], array[swap_index] = array[swap_index], array[start_index]
  
  p array
end

# pivot([4,8,2,1,5,7,6,3])
pivot([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]