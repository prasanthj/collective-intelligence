include Math

def sim_pearson(critics, person1, person2)
        #find items in common
        shared = {}
        critics[person1].each do  |k,v|
                if critics[person2][k] != nil
                        shared[k] = 1
                end
        end

        #both persons doesn't have anything in common
        if shared.length == 0
                return 0
        end

        n = shared.length

        #add all prefs
        sum1 = 0
        sum2 = 0
        #sum of all the squares
        sumSq1 = 0
        sumSq2 = 0
        #sum of the products
        sumP = 0

        shared.each do |k,v|
                sum1 += critics[person1][k]
                sum2 += critics[person2][k]
                sumSq1 += critics[person1][k] ** 2
                sumSq2 += critics[person2][k] ** 2
                sumP += (critics[person1][k] * critics[person2][k])
        end

        #calculate pearson correlation coefficient score
        num = sumP - (sum1 * sum2 / n)
        den = sqrt( (sumSq1 - ((sum1 ** 2)/n)) * (sumSq2 - ((sum2 ** 2)/n)) )

        if den == 0
                return 0
        end

        #return result
        num/den
end