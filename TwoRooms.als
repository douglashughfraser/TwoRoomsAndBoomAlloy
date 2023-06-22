enum Colour {
	Red,
	Blue,
	Grey
}

some abstract sig Team {
	colour: one Colour,
	players: some Player
}

one sig RedTeam extends Team {}{colour = Red}
one sig BlueTeam extends Team {}{colour = Blue}
lone sig GreyTeam extends Team {}{colour = Grey}

some abstract sig Player {	
	balance: Int, // + balance swings towards blue, - balance swings towards red	
	team: one Team,
	team_count: Int,
	grey_count: Int
}{
	team.colour = Blue implies team_count = 1
	team.colour = Red implies team_count = -1
	team.colour = Grey implies team_count = 0

	team.colour = Grey implies grey_count = -2 else grey_count = 1
}

one sig President extends Player{}{ 
	team.colour = Blue
	balance = 0
}
one sig Bomber extends Player{}{ 
	team.colour = Red
	balance = 0 
}
lone sig Doctor extends Player{
	counterpart: one Engineer
}{ 
	team.colour = Blue
	balance = 0
}
lone sig Engineer extends Player{
	counterpart: one Doctor
}{ 
	team.colour = Red 
	balance = 0
}
sig BlueTeamer extends Player{}{ 
	team.colour = Blue 
	balance = 0
}
sig RedTeamer extends Player{}{ 
	team.colour = Red 
	balance = 0
}
lone sig Spy extends Player {}{ 
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}
sig Agent extends Player {}{ 
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}
lone sig Agoraphobe extends Player {}{
	team.colour = Grey
	balance = 0
}
lone sig Ahab extends Player {
	counterpart: one Moby 
}{
	team.colour = Grey
	balance = -1
}
lone sig Moby extends Player {
	counterpart: one Ahab 
}{
	team.colour = Grey
	balance = -1
}
sig Ambassador extends Player {
	counterpart: one Ambassador
}{
	Grey not in team.colour
	balance = 0
	this not in counterpart
}
lone sig Anarchist extends Player {
	counterpart : one Minion
}{
	team.colour = Grey
	balance = 0
}

sig Angel extends Player {}{
	Grey not in team.colour
	team.colour = Red implies balance = 1 else balance = -1
}
lone sig BombBot extends Player {
	counterpart : lone Queen
}{
	team.colour = Grey
	balance = 2
}
sig Bouncer extends Player{}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}
lone sig Butler extends Player {
	counterpart : one Maid
}{
	team.colour = Grey
	balance = 1
}
lone sig Clone extends Player {
	counterpart: one Robot
}{
	team.colour = Grey
	balance = 0
}
sig Clown extends Player{}{
	Grey not in team.colour
	team.colour = Red implies balance = 0 else balance = 0
}
sig Conman extends Player{}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}
sig Coyboy extends Player{
	counterpart1: one Spy + Coyboy + Negotiator,
	counterpart2: one Spy + Coyboy + Negotiator
}{
	Grey not in team.colour
	balance = 0
	disj [counterpart1, counterpart2]
}
sig Criminal extends Player{
	counterpart1: one Doctor,
	counterpart2: one Engineer,
	counterpart3: some Psychologist + Enforcer
}{
	Grey not in team.colour
	team.colour = Red implies balance = -2 else balance = 2
}
lone sig Cupid extends Player{
	counterpart: one Eris
}{
	team.colour = Red
	balance = 1
}

sig Dealer extends Player{
	counterpart1: one Criminal + Thug + Psychologist,
	counterpart2: one Criminal + Medic + Psychologist
}{
	disj[counterpart1, counterpart2]
	Grey not in team.colour
	team.colour = Red implies balance = -2 else balance = 2
}

sig Decoy extends Player{
	counterpart1: one Sniper,
	counterpart2: one Target
}{
	team.colour = Grey
	balance = 0
}

sig Demon extends Player{
}{
	Grey not in team.colour
	balance = 0
}

lone sig DrBoom extends Player{
	counterpart: lone TuesdayKnight
}{
	team.colour = Red
	balance = -3
}

lone sig Drunk extends Player{}{
	team.colour = Grey
	balance = 0
}

sig Enforcer extends Player {
	counterpart1: one ShyGuy + Coyboy + Thug,
	counterpart2: one ShyGuy + Coyboy + Criminal
}{
	Grey not in team.colour
	team.colour = Red implies balance = -2 else balance = 2
}

lone sig Eris extends Player{
	counterpart: one Cupid
}{
	team.colour = Blue
	balance = -1
}

lone sig Gambler extends Player{}{
	team.colour = Grey
	balance = 0
}

lone sig HotPotato extends Player{}{
	team.colour = Grey
	balance = 0
}

lone sig Intern extends Player{
	counterpart: set Victim + Survivor
}{
	team.colour = Grey
	balance = 1
}

sig Invincible extends Player {
	counterpart: some Criminal + Thug
}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}

lone sig Juliet extends Player {
	counterpart: one Romeo
}{
	team.colour = Grey
	balance = -1
}

lone sig Leprechaun extends Player{}{
	team.colour = Grey
	balance = 0
}

lone sig Martyr extends Player{
	counterpart: one Bomber
}{
	team.colour = Red
	balance = 0
}

lone sig Mastermind extends Player{
	counterpart: one Userper + Minion
}{
	team.colour = Grey
	balance = 0
}

lone sig Maid extends Player {
	counterpart : one Butler
}{
	team.colour = Grey
	balance = 1
}

sig Mayor extends Player {}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}

sig Medic extends Player {
	counterpart1: some Criminal + Thug + Dealer,
	counterpart2: some ShyGuy + Coyboy
}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}

lone sig M16 extends Player {
}{
	team.colour = Grey
	balance = 0
}

lone sig Mime extends Player{}{
	Grey not in team.colour
	balance = 0
}

lone sig Minion extends Player{
	counterpart1: one Mastermind + Userper + Anarchist,
	counterpart2: one Mastermind + Userper + Anarchist
}{
	disj[counterpart1, counterpart2]
	team.colour = Grey
	balance = 0
}

lone sig Mistress extends Player{
	counterpart: one Wife
}{
	team.colour = Grey
	balance = 1
}

// Counterparts cardsharers
sig Mummy extends Player{
	counterpart1: some Medic + Psychologist,
	counterpart2: one Mime 
}{
	Grey not in team.colour
	balance = 0
}

// Counterparts cardsharers
sig Negotiator extends Player{
	counterpart: some Criminal + Thug + Dealer
}{
	Grey not in team.colour
	balance = 0
}

lone sig NuclearTyrant extends Player{
	counterpart: one M16
}{
	team.colour = Grey
	balance = 0
}

lone sig Nurse extends Player{
	counterpart: one Doctor
}{
	team.colour = Blue
	balance = 0
}

sig Paparazzo extends Player{}{
	Grey not in team.colour
	balance = 0
}

sig Paranoid extends Player{
	counterpart: some Psychologist + Medic
}{
	Grey not in team.colour
	team.colour = Red implies balance = 1 else balance = -1
}

lone sig PresidentsDaughter extends Player{
	counterpart: one President
}{
	team.colour = Blue
	balance = 0
}

lone sig PrivateEye extends Player{}{
	team.colour = Grey
	balance = 0
}

sig Psychologist extends Player {
	counterpart: one Criminal + Thug
}{
	Grey not in team.colour
	balance = 0
}

lone sig Queen extends Player {
	counterpart : lone BombBot
}{
	team.colour = Grey
	balance = -2
}

lone sig Rival extends Player{
	counterpart: set Victim + Survivor
}{
	team.colour = Grey
	balance = 1
}

lone sig Romeo extends Player {
	counterpart: one Juliet
}{
	team.colour = Grey
	balance = -1
}

lone sig Robot extends Player {
	counterpart: one Clone
}{
	team.colour = Grey
	balance = 0
}

sig Security extends Player {}{
	Grey not in team.colour
	team.colour = Red implies balance = -1 else balance = 1
}

sig ShyGuy extends Player {
	counterpart: one Psychologist + Medic + Dealer
}{
	Grey not in team.colour
	team.colour = Red implies balance = 1 else balance = -1
}

sig Sniper extends Player{
	counterpart1: one Decoy,
	counterpart2: one Target
}{
	team.colour = Grey
	balance = 0
}

lone sig Survivor extends Player{
	counterpart: set Intern + Rival
}{
	team.colour = Grey
	balance = -1
}

lone sig Target extends Player{
	counterpart1: one Sniper,
	counterpart2: one Decoy
}{
	team.colour = Grey
	balance = 0
}

sig Thug extends Player{
	counterpart1: some Doctor + Engineer,
	counterpart2: some Spy + Psychologist + Medic
}{
	Grey not in team.colour
	team.colour = Red implies balance = -2 else balance = 2
}

lone sig Tinkerer extends Player{
	counterpart: one Engineer
}{
	team.colour = Red
	balance = 0
}

lone sig Traveller extends Player{}{
	team.colour = Grey
	balance = 0
}

lone sig TuesdayKnight extends Player{
	counterpart: lone DrBoom
}{
	team.colour = Blue
	balance = 3
}

lone sig Userper extends Player {
	counterpart: one Mastermind + Minion
}{
	team.colour = Grey
	balance = 0
}

lone sig Victim extends Player{
	counterpart: set Intern + Rival
}{
	team.colour = Grey
	balance = -1
}

lone sig Wife extends Player{
	counterpart: one Mistress
}{
	team.colour = Grey
	balance = 1
}

lone sig Zombie extends Player{
	counterpart1: one Doctor,
	counterpart2: one Engineer
}{
	team.colour = Grey
	balance = 0
}


fact {
	// Even balance for teams
	(sum p:Player | p.balance) = 0

	// Even player number on teams
	(sum p:Player | p.team_count) = 0

	// 2-to-1 ratio of grey to blue/reds
	//(sum p:Player | p.grey_count) > 1 

	// Two-parter, ensures bidirection player list and team allegiances
	// 1. All players in a team list know they play for that team
	all t: Team, player: t.players |
		player.team = t

	// 2. All players who play for a team are listed on that team's teamlist
	all p: Player, t: p.team |
		p in t.players

	#Ambassador = 0 or #Ambassador = 2

	all disjoint p1, p2: Agent | not (p1.team = p2.team)
	all disjoint p1, p2: Ambassador | not (p1.team = p2.team)
	all disjoint p1, p2: Angel | not (p1.team = p2.team)
	all disjoint p1, p2: Bouncer | not (p1.team = p2.team)
	all disjoint p1, p2: Clown | not (p1.team = p2.team)
	all disjoint p1, p2: Conman | not (p1.team = p2.team)
	all disjoint p1, p2: Coyboy | not (p1.team = p2.team)
	all disjoint p1, p2: Criminal | not (p1.team = p2.team)
	all disjoint p1, p2: Dealer | not (p1.team = p2.team)
	all disjoint p1, p2: Demon | not (p1.team = p2.team)
	all disjoint p1, p2: Demon | not (p1.team = p2.team)
	all disjoint p1, p2: Enforcer | not (p1.team = p2.team)
	all disjoint p1, p2: Invincible | not (p1.team = p2.team)
	all disjoint p1, p2: Mayor | not (p1.team = p2.team)
	all disjoint p1, p2: Mummy | not (p1.team = p2.team)
	all disjoint p1, p2: Mime | not (p1.team = p2.team)
	all disjoint p1, p2: Negotiator | not (p1.team = p2.team)
	all disjoint p1, p2: Psychologist | not (p1.team = p2.team)
	all disjoint p1, p2: Paranoid | not (p1.team = p2.team)
	all disjoint p1, p2: Paparazzo | not (p1.team = p2.team)
	all disjoint p1, p2: Security | not (p1.team = p2.team)
	all disjoint p1, p2: ShyGuy | not (p1.team = p2.team)
	all disjoint p1, p2: Thug | not (p1.team = p2.team)

	// Avoid cardsharers if sniper in play (life's hard enough for them as it is)
	all sniper, others: Player | sniper in Sniper implies {
		others not in HotPotato
		others not in Leprechaun
	}

	// Avoid foolish players in hotpotato games
	all hotpotato, others: Player | hotpotato in HotPotato implies {
		others not in Dealer
		others not in Leprechaun
	}

	// Card swappers and obscurers in tyrant games
	all nucleartyrant, others: Player | nucleartyrant in NuclearTyrant implies {
		others not in Criminal
		others not in Thug
		others not in HotPotato
		others not in Leprechaun
	}

	// Card swappers and obscurers in mi6 games
	all mi6, others: Player | mi6 in NuclearTyrant implies {
		others not in Criminal
		others not in Thug
		others not in HotPotato
		others not in Leprechaun
	}

	// Avoid foolish players in private eye games
	all privateeye, others: Player | privateeye in PrivateEye implies {
		others not in Criminal
		others not in Thug
		others not in HotPotato
		others not in Leprechaun
	}

	// Avoid medic and invincible in zombie games
	all zombie, others: Player | zombie in Zombie implies {
		others not in Medic
		others not in Invincible
	}

	// Game restrictor
	all p: Player | p in (President + Doctor + Bomber + Engineer + RedTeamer + BlueTeamer + Spy + Coyboy)

}

// No agents, ambassadors or enforcers in <11 player games
// Only use bouncers with an odd number of players (or even numbers with buried cards)
// Only use Mayors in games with even numbered rooms

// For: 7, 9, 11, ,13, 15, 17, 19, 21, 23, 25, 27, 29 Player
run OddPlayersNoBuried{
} for exactly 29 Player, 0 Drunk, 0 Gambler, 0 PrivateEye, 0 PresidentsDaughter, 0 Martyr, 0 Nurse, 0 Tinkerer

// For: 6, 10, 14, 18, 22, 26, 30 Player
run EvenPlayersOddRoomsNoBuried{
} for exactly 10 Player, 0 Bouncer, 0 Drunk, 0 Gambler, 0 Mayor, 0 PrivateEye, 0 PresidentsDaughter, 0 Martyr, 0 Nurse, 0 Tinkerer

// For: 8, 12, 16, 20, 24, 28 Player
run EvenPlayersEvenRoomsNoBuried{
} for exactly 28 Player, 0 Bouncer, 0 Drunk, 2 Mayor, 0 Gambler, 0 PrivateEye, 0 PresidentsDaughter, 0 Martyr, 0 Nurse, 0 Tinkerer

// Buried games, note that this means you say "exactly <p+1> Player" to account for the buried card
// For: 7, 9, 11, ,13, 15, 17, 19, 21, 23, 25, 27, 29 Player
run OddPlayersBuried{ 
} for exactly 30 Player, 1 Drunk, 1 Gambler, 1 PrivateEye, exactly 1 PresidentsDaughter, exactly 1 Martyr, exactly 1 Nurse, exactly 1 Tinkerer

// For: 6, 10, 14, 18, 22, 26, 30 Player
run EvenPlayersOddRoomsBuried{
} for exactly 31 Player, 0 Bouncer, 1 Drunk, 1 Gambler, 1 PrivateEye, 0 Mayor, exactly 1 PresidentsDaughter, exactly 1 Martyr, exactly 1 Nurse, exactly 1 Tinkerer

// For: 8, 12, 16, 20, 24, 28 Player
run EvenPlayersEvenRoomsBuried{	
} for exactly 29 Player, 0 Bouncer, 1 Drunk, 1 Gambler, 1 PrivateEye, 2 Mayor, exactly 1 PresidentsDaughter, exactly 1 Martyr, exactly 1 Nurse, exactly 1 Tinkerer
