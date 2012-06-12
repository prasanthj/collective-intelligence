include Math

#input dataset
critics = {
	'Lisa Rose' => {
		'Lady in the water' => 2.5,
		'Snakes on a plane' => 3.5,
		'Just my luck' => 3.0,
		'Superman returns' => 3.5,
		'You, me and dupree' => 2.5,
		'The night listener' => 3.0,
	},
	'Gene Seymour' => {
		'Lady in the water' => 3.0,
		'Snakes on a plane' => 3.5,
		'Just my luck' => 1.5,
		'Superman returns' => 5.0,
		'You, me and dupree' => 3.5,
		'The night listener' => 3.0,	
	},
	'Michael Philips' => {
		'Lady in the water' => 2.5,
		'Snakes on a plane' => 3.0,
		'Superman returns' => 3.5,
		'The night listener' => 4.0,	
	},
	'Claudia Puig' => {
		'Snakes on a plane' => 3.5,
		'Just my luck' => 3.0,
		'The night listener' => 4.5,	
		'Superman returns' => 4.0,
		'You, me and dupree' => 2.5,
	},
	'Mick LaSalle' => {
		'Lady in the water' => 3.0,
		'Snakes on a plane' => 4.0,
		'Just my luck' => 2.0,
		'Superman returns' => 3.0,
		'The night listener' => 3.0,	
		'You, me and dupree' => 2.0,
	},
	'Jack Mathews' => {
		'Lady in the water' => 3.0,
		'Snakes on a plane' => 4.0,
		'The night listener' => 3.0,	
		'Superman returns' => 5.0,
		'You, me and dupree' => 3.5,
	},
	'Toby' => {
		'Snakes on a plane' => 4.5,
		'You, me and dupree' => 1.0,	
		'Superman returns' => 4.0,
	},
}

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

puts sim_pearson(critics, 'Lisa Rose', 'Gene Seymour')