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

puts sim_euclidean(critics, 'Lisa Rose', 'Gene Seymour')