/* Backpacks
 * Contains:
 *		Backpack
 *		Backpack Types
 *		Satchel Types
 */

/*
 * Backpack
 */

/obj/item/weapon/storage/backpack
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "backpack"
	item_state = "backpack"
	w_class = 4.0
	slot_flags = SLOT_BACK	//ERROOOOO
	max_w_class = 3
	max_combined_w_class = 21

/obj/item/weapon/storage/backpack/attackby(obj/item/weapon/W as obj, mob/user as mob)
	playsound(src.loc, "rustle", 50, 1, -5)
	..()

/*
 * Backpack Types
 */

/obj/item/weapon/storage/backpack/holding
	name = "bag of holding"
	desc = "A backpack that opens into a localized pocket of Blue Space."
	origin_tech = "bluespace=4"
	icon_state = "holdingpack"
	max_w_class = 5
	max_combined_w_class = 35

	New()
		..()
		return

	handle_item_insertion(obj/item/W)
		if(!..()) return 0
		if(istype(W, /obj/item/weapon/storage/backpack/holding) && !W.crit_fail)
			investigate_log("has become a singularity. Caused by [usr.key]","singulo")
			usr << "\red The Bluespace interfaces of the two devices catastrophically malfunction!"
			qdel(W)
			var/obj/machinery/singularity/singulo = new /obj/machinery/singularity (get_turf(src))
			singulo.energy = 300 //should make it a bit bigger~
			message_admins("[key_name_admin(usr)] detonated a bag of holding")
			log_game("[key_name(usr)] detonated a bag of holding")
			qdel(src)
			return

	attackby(obj/item/weapon/W as obj, mob/user as mob)
		if(crit_fail)
			user << "\red The Bluespace generator isn't working."
			return
		..()

	proc/failcheck(mob/user as mob)
		if (prob(src.reliability)) return 1 //No failure
		if (prob(src.reliability))
			user << "\red The Bluespace portal resists your attempt to add another item." //light failure
		else
			user << "\red The Bluespace generator malfunctions!"
			for (var/obj/O in src.contents) //it broke, delete what was in it
				qdel(O)
			crit_fail = 1
			icon_state = "brokenpack"


/obj/item/weapon/storage/backpack/santabag
	name = "Santa's Gift Bag"
	desc = "Space Santa uses this to deliver toys to all the nice children in space in Christmas! Wow, it's pretty big!"
	icon_state = "giftbag0"
	item_state = "giftbag"
	w_class = 4.0
	storage_slots = 20
	max_w_class = 3
	max_combined_w_class = 400 // can store a ton of shit!

/obj/item/weapon/storage/backpack/cultpack
	name = "trophy rack"
	desc = "It's useful for both carrying extra gear and proudly declaring your insanity."
	icon_state = "cultpack"
	item_state = "backpack"

/obj/item/weapon/storage/backpack/clown
	name = "Giggles von Honkerton"
	desc = "It's a backpack made by Honk! Co."
	icon_state = "clownpack"
	item_state = "clownpack"

/obj/item/weapon/storage/backpack/medic
	name = "medical backpack"
	desc = "It's a backpack especially designed for use in a sterile environment."
	icon_state = "medicalpack"
	item_state = "medicalpack"

/obj/item/weapon/storage/backpack/vir
	name = "virologist backpack"
	desc = "A sterile backpack with virologist colours."
	icon_state = "viropack"

/obj/item/weapon/storage/backpack/chem
	name = "chemist backpack"
	desc = "A sterile backpack with chemist colours."
	icon_state = "chempack"

/obj/item/weapon/storage/backpack/gen
	name = "geneticist backpack"
	desc = "A sterile backpack with geneticist colours."
	icon_state = "genpack"

/obj/item/weapon/storage/backpack/tox
	name = "scientist backpack"
	desc = "Useful for holding research materials."
	icon_state = "toxpack"

/obj/item/weapon/storage/backpack/botany
	name = "botany backpack"
	desc = "A green backpack for plant related work."
	icon_state = "botanypack"

/obj/item/weapon/storage/backpack/security
	name = "security backpack"
	desc = "It's a very robust backpack."
	icon_state = "securitypack"
	item_state = "securitypack"

/obj/item/weapon/storage/backpack/captain
	name = "captain's backpack"
	desc = "It's a special backpack made exclusively for Nanotrasen officers."
	icon_state = "captainpack"
	item_state = "captainpack"

/obj/item/weapon/storage/backpack/industrial
	name = "industrial backpack"
	desc = "It's a tough backpack for the daily grind of station life."
	icon_state = "engiepack"
	item_state = "engiepack"

/*
 * Satchel Types
 */

/obj/item/weapon/storage/backpack/satchel
	name = "leather satchel"
	desc = "It's a very fancy satchel made with fine leather."
	icon_state = "satchel"

/obj/item/weapon/storage/backpack/satchel/withwallet
	New()
		..()
		new /obj/item/weapon/storage/wallet/random( src )

/obj/item/weapon/storage/backpack/satchel_norm
	name = "satchel"
	desc = "A trendy looking satchel."
	icon_state = "satchel-norm"

/obj/item/weapon/storage/backpack/satchel_eng
	name = "industrial satchel"
	desc = "A tough satchel with extra pockets."
	icon_state = "satchel-eng"
	item_state = "engiepack"

/obj/item/weapon/storage/backpack/satchel_med
	name = "medical satchel"
	desc = "A sterile satchel used in medical departments."
	icon_state = "satchel-med"
	item_state = "medicalpack"

/obj/item/weapon/storage/backpack/satchel_vir
	name = "virologist satchel"
	desc = "A sterile satchel with virologist colours."
	icon_state = "satchel-vir"

/obj/item/weapon/storage/backpack/satchel_chem
	name = "chemist satchel"
	desc = "A sterile satchel with chemist colours."
	icon_state = "satchel-chem"

/obj/item/weapon/storage/backpack/satchel_gen
	name = "geneticist satchel"
	desc = "A sterile satchel with geneticist colours."
	icon_state = "satchel-gen"

/obj/item/weapon/storage/backpack/satchel_tox
	name = "scientist satchel"
	desc = "Useful for holding research materials."
	icon_state = "satchel-tox"

/obj/item/weapon/storage/backpack/satchel_sec
	name = "security satchel"
	desc = "A robust satchel for security related needs."
	icon_state = "satchel-sec"
	item_state = "securitypack"

/obj/item/weapon/storage/backpack/satchel_hyd
	name = "hydroponics satchel"
	desc = "A green satchel for plant related work."
	icon_state = "satchel_hyd"

/obj/item/weapon/storage/backpack/satchel_cap
	name = "captain's satchel"
	desc = "An exclusive satchel for Nanotrasen officers."
	icon_state = "satchel-cap"
	item_state = "captainpack"

/*
 * Other
 */

/obj/item/weapon/storage/backpack/mime
	name = "Parcel Parceaux"
	desc = "A silent backpack made for those silent workers. Silence Co."
	icon_state = "mimepack"
	item_state = "mimepack"

/*
 * Dufflebags (LOADSEMONE)
 */

/obj/item/weapon/storage/backpack/dufflebag
	name = "dufflebag"
	desc = "A large dufflebag for holding extra things"
	icon_state = "duffle"
	item_state = "duffle"
	storage_slots = 9
	slowdown = 1
	max_combined_w_class = 27

/obj/item/weapon/storage/backpack/dufflebag/syndiemed
	name = "medical dufflebag"
	desc = "A large dufflebag for holding extra tactical medical supplies."
	icon_state = "duffle-syndiemed"
	item_state = "duffle-syndiemed"
	slowdown = 0

/obj/item/weapon/storage/backpack/dufflebag/syndieammo
	name = "ammunition dufflebag"
	desc = "A large dufflebag for holding extra weapons ammunition and supplies."
	icon_state = "duffle-syndieammo"
	item_state = "duffle-syndieammo"
	slowdown = 0

/obj/item/weapon/storage/backpack/dufflebag/captain
	name = "captain's dufflebag"
	desc = "A large dufflebag for holding extra captainly goods."
	icon_state = "duffle-captain"
	item_state = "duffle-captain"

/obj/item/weapon/storage/backpack/dufflebag/med
	name = "medical dufflebag"
	desc = "A large dufflebag for holding extra medical supplies."
	icon_state = "duffle-med"
	item_state = "duffle-med"

/obj/item/weapon/storage/backpack/dufflebag/sec
	name = "security dufflebag"
	desc = "A large dufflebag for holding extra security supplies and ammunition."
	icon_state = "duffle-sec"
	item_state = "duffle-sec"

/obj/item/weapon/storage/backpack/dufflebag/engineering
	name = "engineering dufflebag"
	desc = "A large dufflebag for holding extra tools and supplies."
	icon_state = "duffle-eng"
	item_state = "duffle-eng"

/obj/item/weapon/storage/backpack/dufflebag/clown
	name = "clown's dufflebag"
	desc = "A large dufflebag for holding lots of funny gags!"
	icon_state = "duffle-clown"
	item_state = "duffle-clown"
