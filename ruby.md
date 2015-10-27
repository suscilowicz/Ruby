## Zaczynamy przygodę z Ruby

### Array

```ruby
arr = [1, 2, 3, 4, 5, 6]
arr[2]    #=> 3
arr[100]  #=> nil
arr[-3]   #=> 4
arr[2, 3] #=> [3, 4, 5]
arr[1..4] #=> [2, 3, 4, 5]
arr[1..-3] #=> [2, 3, 4]

browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count #=> 5
browsers.empty? #=> false
browsers.include?('Konqueror') #=> false

arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]
arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]
arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]
arr.insert(3, 'orange', 'pear', 'grapefruit')
#=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]
arr.shift #=> 1
arr #=> [2, 3, 4, 5]
arr = [1, 2, 2, 3]
arr.delete(2) #=> 2
arr #=> [1,3]

arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']

arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]
#
```

### Enumerable

```Ruby
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
[nil, true, 99].all? #=> false

%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
[nil, true, 99].any?                              #=> true

a = [1, 2, 3, 4, 5, 0]
a.drop(3)             #=> [4, 5, 0]
```

### Hash
```Ruby
#A Hash can be easily created by using its implicit form:
grades = { "Jane Doe" => 10, "Jim Doe" => 6 }

#Hashes allow an alternate syntax form when your keys are always symbols. Instead of
#options = { :font_size => 10, :font_family => "Arial" }

#You could write it as:
options = { font_size: 10, font_family: "Arial" }

#Each named key is a symbol you can access in hash:
options[:font_size]  # => 10

# Hash can also be created through its ::new method:
grades = {}
grades["Dorothy Doe"] = 9
```
