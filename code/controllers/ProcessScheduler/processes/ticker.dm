/datum/controller/process/ticker/setup()
	name = "ticker"
	schedule_interval = 20

	if(!ticker)
		ticker = new

	spawn(0)
		if(ticker)
			ticker.pregame()

/datum/controller/process/ticker/doWork()
	ticker.process()
	scheck()