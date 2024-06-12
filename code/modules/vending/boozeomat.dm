/obj/machinery/vending/boozeomat
	name = "\improper Booze-O-Mat"
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one."
	icon_state = "boozeomat"
	icon_deny = "boozeomat-deny"
	products = list( // All of drink dispenser reagents should be available here.
		/obj/item/reagent_containers/food/drinks/drinkingglass = 30,
		/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 12,
		/obj/item/reagent_containers/food/drinks/modglass/small = 10,
		/obj/item/reagent_containers/food/drinks/modglass = 10,
		/obj/item/reagent_containers/food/drinks/modglass/large = 10,
		/obj/item/reagent_containers/food/drinks/flask = 3,
		/obj/item/reagent_containers/food/drinks/ice = 10,
		/obj/item/reagent_containers/food/drinks/waterbottle/large = 6,
		/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 4,
		/obj/item/reagent_containers/food/drinks/bottle/tomatojuice = 4,
		/obj/item/reagent_containers/food/drinks/bottle/limejuice = 4,
		/obj/item/reagent_containers/food/drinks/bottle/lemonjuice = 4,
		/obj/item/reagent_containers/food/drinks/bottle/pineapplejuice = 4,
		/obj/item/reagent_containers/food/drinks/bottle/cream = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/cola = 8,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/tonic = 8,
		/obj/item/reagent_containers/food/drinks/soda_cans/sodawater = 8,
		/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 4,
		/obj/item/reagent_containers/food/drinks/soda_cans/thirteenloko = 4,
		/obj/item/reagent_containers/food/drinks/bottle/grenadine = 4,
		/obj/item/reagent_containers/food/drinks/bottle/menthol = 4,
		/obj/item/reagent_containers/food/drinks/mug/tea = 8,
		/obj/item/reagent_containers/food/drinks/coffee = 8,
		/obj/item/reagent_containers/food/drinks/ale = 6,
		/obj/item/reagent_containers/food/drinks/beer = 8,
		/obj/item/reagent_containers/food/drinks/bottle/gin = 5,
		/obj/item/reagent_containers/food/drinks/bottle/whiskey = 5,
		/obj/item/reagent_containers/food/drinks/bottle/tequila = 5,
		/obj/item/reagent_containers/food/drinks/bottle/vodka = 5,
		/obj/item/reagent_containers/food/drinks/bottle/vermouth = 5,
		/obj/item/reagent_containers/food/drinks/bottle/rum = 5,
		/obj/item/reagent_containers/food/drinks/bottle/wine = 5,
		/obj/item/reagent_containers/food/drinks/bottle/cognac = 5,
		/obj/item/reagent_containers/food/drinks/bottle/kahlua = 5,
		/obj/item/reagent_containers/food/drinks/bottle/hcider = 5,
		/obj/item/reagent_containers/food/drinks/bottle/absinthe = 5,
		/obj/item/reagent_containers/food/drinks/bottle/grappa = 5,
		/obj/item/reagent_containers/food/drinks/bottle/amaretto = 5,
		/obj/item/reagent_containers/food/drinks/bottle/sake = 5,
		/obj/item/reagent_containers/food/drinks/bottle/applejack = 5,
		/obj/item/reagent_containers/food/drinks/bottle/triplesec = 5,
		/obj/item/reagent_containers/food/drinks/bottle/coconut = 5,
		/obj/item/reagent_containers/food/drinks/bottle/cacao = 5,
		/obj/item/reagent_containers/food/drinks/bottle/menthe = 5,
		/obj/item/reagent_containers/food/drinks/bottle = 15,
		/obj/item/reagent_containers/food/drinks/bottle/small = 15,
		/obj/item/garnish/olives = 10,
		/obj/item/garnish/umbrellared = 10,
		/obj/item/garnish/umbrellablue = 10,
		/obj/item/garnish/umbrellagreen = 10
	)
	contraband = list()
	premium = list(
		/obj/item/reagent_containers/glass/bottle/ethanol = 4,
		/obj/item/reagent_containers/glass/bottle/sugar = 3,
		/obj/item/reagent_containers/food/drinks/bottle/fernet = 5,
		/obj/item/reagent_containers/food/drinks/bottle/champagne = 5,
		/obj/item/reagent_containers/food/drinks/bottle/trappist = 5)

	product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty 'round this sector?"
	product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	req_access = list(ACCESS_BAR)
	refill_canister = /obj/item/vending_refill/boozeomat
	default_price = 120
	extra_price = 200
	light_mask = "boozeomat-light-mask"

/obj/machinery/vending/boozeomat/all_access
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one. This model appears to have no access restrictions."
	req_access = null

/obj/machinery/vending/boozeomat/syndicate_access
	req_access = list(ACCESS_SYNDICATE)
	age_restrictions = FALSE

/obj/item/vending_refill/boozeomat
	machine_name = "Booze-O-Mat"
	icon_state = "refill_booze"
