module Enumerable_Refine # defined the module which class we are refining, whith an new name
    refine Array do # the Class is refining
        # implement a new own method
        def my_map # The method create a new array whith values from calculated block
            new_array = [] 
            if block_given? # check that the block exist
                i = 0
                while i < self.length 
                    new_array[i] = yield self[i] # it sends the objects element to the block
                                                  # and then receive the result for the new array
                    i += 1
                end            
            end
            new_array     
        end        

        # the method creates a new array which contains elements
        #  that conforms the block conditions
        def my_select
            new_array = []
            if block_given?
                i = 0
                while i < self.length 
                    if yield self[i]
                        new_array << self[i]
                    end
                    i += 1
                end            
            end
            new_array       
        end        

        # the method sends to the block each elements of array, 
        # and the block executes code whith tise element
        def my_each
            if block_given?
                i = 0
                while i < self.length
                    yield self[i]                    
                    i += 1
                end            
            end
        self  # as parent Array#each, my_each return the original array too  
        end
    end
end