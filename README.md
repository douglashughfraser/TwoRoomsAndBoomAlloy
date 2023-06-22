# Two Rooms and a Boom: Game Generator in Alloy
Alloy 6 model that generates random, approximately balanced play sets of the game Two Rooms and a Boom.

Alloy functions on a system of specified requirements; I have used this to create signatures representing each card in the print-and-play deck and the requirements of those cards.

# How it Works
Firstly, games will always have all the other cards that complete their set (i.e. any game with Moby will always have an Ahab; the Decoy, Target and Sniper will only ever appear together in a game etc.) 

Additionally, in places where a card has other cards that are recommended, a subset of those cards will appear alongside it (for example, any game with a Dealer will also have a Criminal, Psychologist or Medic). I've made the decision to make some exceptions to this in cases where I don't think the recommendation is particularly necessary (Demons and Angels).

Conversely, cards which do not synergize well or which are not recommended to appear together won't. Most of this is to restrict what appears alongside the Hot Potato and Leprechaun cards (no Snipers, Targets and Decoy) but also to avoid Medic and Invincible cards when the Zombie is in play.

Using these requirements as a baseline, the tool enables experimentation with creating asymmetrical games. Here the characters on each team are usually not the same, but the overall balance of the game should be relatively even. This balance is calculated to both the predisposed allegiances of the grey team and the strength of the red and blue teams relative to each other. For example, a red team may contain a lot of characters that can impart conditions and force card shares, but the grey team might feature a lot of cards that want to know which room the president is in returning the balance back closer to even.
It's not perfect (giving an accurate approximation of the objective strength of any given card isn't possible) so some consideration of its output is recommended. However, it comes up with some interesting suggestions, and it can generate a lot of them quickly, so I'm looking forward to breaking this out at my next games night and flicking through some with some friends.


# How To Use
1. Download Alloy 6 (5 would probably work too): https://alloytools.org/download.html
2. Paste the model solution into the box.
3. Choose the right game setting for the number of players you have. Explained below.

Here's the list of all the run options:

_run OddPlayersNoBuried_

_run EvenPlayersOddRoomsNoBuried_

_run EvenPlayersEvenRoomsNoBuried_

_run OddPlayersBuried_

_run EvenPlayersOddRoomsBuried_

_run EvenPlayersEvenRoomsBuried_

Depending on how many players you have certain cards shouldn't be included (Mayor and Bouncer) as they rely on an odd or even number of players in the rooms to work. For quick reference, I've commented each number from 6-30 above the appropriate run option. 
Some cards require a buried card to work, so if you're not going to bury a card then select one of the "...NoBuried" options. Selecting a "...Buried" game enforces the presence of the support primary cards (Presidents Daughter, Martyr, Tinkerer and Nurse) and enables the optional presence of the Drunk, Private Eye and Gambler.

4. Modify the number of players you're playing with. After the brackets on each run option is a list, you only need to modify the "exactly # Player" part to be the number of players in the game. Note that in a buried game the buried card is included in the player total so this number should be the number of players in the game +1.

Example:
_run OddPlayersNoBuried{
	//(sum p:Player | p.rating) = 7
} for **exactly 7 Player**, 0 Drunk, 0 Gambler, 0 PrivateEye_

# On "Ratings"
This is a system similar to the balance scheme but instead enables certain cards to be positively or negatively weighted to improve their frequency. To use it, uncomment the //(sum p:Player | p.rating) = 7 line and - if you like - edit the rating of any cards within the signatures. Note that this makes it harder for the solver to find instances. I'd hoped to use this to try to produce the most fun games I could imagine, but personally I don't think the results are markedly improved and prefer having more instances and just sifting past games that don't look interesting. 

If there are cards that you specifically hate (looking at you Clown...) then you can more efficiently remove them by adding ", 0 Clown" to the end of the list following any of the run commands. Likewise, you can instead enforce that a card always appear by adding ", exactly 2 Clown".
