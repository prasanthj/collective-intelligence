include Math

#returns euclidean distance based similarity scores for person1 and person2
def sim_euclidean(prefs, person1, person2)
        #find items in common
        shared = {}
        prefs[person1].each do  |k,v|
                if prefs[person2][k] != nil
                        shared[k] = 1
                end
        end

        #both persons doesn't have anything in common
        if shared.length == 0
                return 0
        end

        #calculate sum of squares
        sum_of_squares = 0
        shared.each do |k,v|
                sum_of_squares += (prefs[person1][k] - prefs[person2][k]) ** 2
        end

        #return euclidean distance. 1 is added to denominator to avoid divide by zero
        1/(1 + sqrt(sum_of_squares))
end
