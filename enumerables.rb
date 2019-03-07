module Enumerable

    def my_each
        yield self
    end

    def my_each_with_index
        i = 0
        for element in self
            yield(element, i)
            i += 1
        end
    end

    def my_select
        arr = []
        self.length.times { |i| yield(self[i]) ? arr.push(self[i]) : i }
        arr
    end

    def my_all?
        result = true
        self.length.times { |i| yield(self[i]) ? true : result = false }
        result

    end

    def my_any?

        result = false
        self.length.times { |i| yield(self[i]) ? result = true : false}
        result


    end

    def my_none?

        result = true
        self.length.times { |i| yield(self[i]) ? result = false : false }
        result

    end

    def my_count(number)

        count = 0
        if number != nil
            self.length.times { |i| self[i] == number ? count += 1 : false}
        else
            self.length.times { |i| yield(self[i]) ? count += 1 : false}
        end
        count

    end

    def my_map(&map_proc)

        arr = []
        self.length.times { |i| arr.push(yield(self[i])) }
        arr

    end

    def my_inject
        (self.length - 1).times do |total|
            total = yield(self[0], self[1])
            puts self[0]
            puts self[1]
            self.shift(2)
            self.unshift(total)
            puts self.join(', ')
        end
        self
    end

    def multiply_els

        self.my_inject { |total, number| total *= number}

    end


    array = [1, 2, 3, 4, 5, 6, 7]

#puts array.each { |x| x }
#puts array.my_each { |x| x }

#array.each_with_index { |x, y| puts "#{x}: #{y}" }
#array.my_each_with_index { |x, y| puts "#{x}: #{y}" }

#puts array.select { |x| x > 2}
#puts array.my_select { |x| x > 2 }

#puts array.all? { |x| x.is_a? Integer }
#puts array.my_all? { |x| x.is_a? Integer }

#puts array.any? { |x| x.is_a? String }
#puts array.my_any? { |x| x.is_a? String }

#puts array.none? { |x| x.is_a? String } 
#puts array.my_none? { |x| x.is_a? String }

#puts array.count(2) { |x| x > 3 }
#puts array.my_count(2) { |x| x > 3 }

#puts array.map { |x| x * 3 }
#puts array.my_map { |x| x * 3 }
#puts array.my_map(&map_proc)
map_proc = Proc.new { |x| x + 2 }

#puts array.inject { |total, number| total += number }
#puts array.my_inject { |total, number| total += number}
#puts array.multiply_els

end