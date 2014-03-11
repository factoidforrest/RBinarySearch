class Collection 
  def initialize
    @col = []
  end
  def col
    @col
  end
  def insert(e)
    @col.insert((search(e)), e)
    e
  end
  def search(e, l = 0, u = @col.length - 1)
    while l <= u
      m = (u+l) / 2
      e < @col[m] ? u = m - 1 : l = m + 1 
    end
    l
  end
  def removeLargest()
    @col.pop
  end
  def remove(n)
    @col.delete_at(search(n)-1)
    n
  end 
end

collection = Collection.new
300.times do |n|
  puts "Inserted: " +  collection.insert(rand(1..300)).to_s  
end
puts "Inserted the only non random value: " + collection.insert(55).to_s

puts collection.col.to_s
puts "Size: " + collection.col.size.to_s
puts "The largest value was " + collection.removeLargest.to_s + "  It was destroyed in the making of this print"
puts "Size:" + collection.col.size.to_s
puts "Occurences of element 55: " + collection.col.count(55).to_s
puts "Removed by identifier/value: " + collection.remove(55).to_s 
puts "occurences of element 55: " + collection.col.count(55).to_s

#Writeup
#General Notes
  #I should mention that I cheated a bit and used the elements integer value as its identifier. I
  #cannot think of any reason that would matter since the elements are identical
  #
  #This system is optimized for frequent use of the removeLargest() method.  Since the values are stored in
  #order, it is very easy to find the largest value
  #
  #Adding all of those values randomly and performing a single sort would be much faster than the repeated
  #binary sorts that are performed on insertion.  My implimentation has the benefit of keeping the data in a usable form at
  #any stage.  It is poorly optimized for data arrizing in batches as it likely would be in a high volume web
  #app
  #
#Ideal Solution?
  #Different solutions are ideal for different problems, depending on what action is going to be the most
  #frequent I.E. bottleneck.  I think this is close to ideal for frequent Pops of the largest value, which is O(1)
  #
  #Unfortunately, insertions into the list shift the entire index, which is O(n) and very wasteful.
  #
  #in sumary, this implimentation is slow to insert and quick to pop
  
#Future Improvements
  #1:If the system was likely to experience many repeat values, I would create an object with an additional field
  #to store the number of occurences instead of adding duplicates.  
  #
  #2:It is entirely possible that a Binary Tree structure would have been better.  Instead, I opted for the
  #binary search of a sorted flat structure.  I'm actually really curious which is better.  When hunting for a value in
  #a tree, a comparator is used at each node to decide whether to go right or left.  This is identical to the
  #comparison done by my search() method at the mid point (m)  of the set.  
  #
  #3: TIMERS.  I want to know how fast the insertion is for different sizes of array. My computer just spent 15
  #minutes adding one million random values and showed no sign of slowing
  #
  #4: After research, I wish I had implimented a skip list.  It would be much faster to insert and remove.  
