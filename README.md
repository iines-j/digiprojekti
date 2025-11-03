
# Wild Archive - **GAME DESIGN DOCUMENT**

## Introduction

### Game Summary
Wild Archive is a a cozy game, where the player tries to photograph animals for their nature journal. 

### Inspiration
#### Neko Atsume
Neko Atsume gave me the idea for the base gameplay loop for my game. I liked the chill gameplay of cats visiting the yard, getting currency per visit, spending it on more goodies and then attracting even more cats. The game also doesnt have a set goal or finish line, so the player can choose if they want to aim for a goal such as completing the journal or buying all possible goodies. 

<p float="left">
  <img src="https://github.com/user-attachments/assets/2d0ea3e6-e288-45b2-9085-b227a9815497" height="300"></img>
  <img src="https://github.com/user-attachments/assets/435c38a5-fb8f-4b4f-a53c-a1d30b2728a9" height="300"></img>
  <img src="https://github.com/user-attachments/assets/6246a42a-8889-4df3-988a-0350cc03c6e2" height="300"></img>
  <img src="https://github.com/user-attachments/assets/4e3ee9ca-2aeb-49b3-8352-c221bbd79e29" height="300"></img>
</p>



#### Animal Crossing
Animal Crossing gave me the idea of animals appearing based on different natural conditions such as season, time, weather and location. 

<p float="left">
  <img src="https://github.com/user-attachments/assets/b8762411-3182-4b06-a651-c83f308b3a75" width="500"></img>
  <img src="https://github.com/user-attachments/assets/2a330868-1b69-43ad-bd40-328779d244e2" width="500"></img>
</p>

### Player Experience
In Wild Archive, the player can enjoy the calmig sounds of nature, photograph cute animals, and fill their nature journal. The player can earn money by taking pictures of the animals that appear. By upgrading their gear and unlocking new areas, the player will be able to photograph even more different kinds of animals.

### Platform
Windows PC

### Development Software
- Game engine: Godot
- Art: Inkscape, Procreate

### Genre
Casual, cozy, idle

### Target Audience
This game is aimed for casual game players, who enjoy nature and all its cute critters. 

----
## Concept
### Gameplay
The player will start off with a basic camera and access to one nature area.
Gear upgrades will make the quality of photos better and earn the player more money. Some skittish animals may not appear at all or be spooked away if the player has the wrong kind of gear. The player has to consider what kind of gear is the best to photograph certain animals (such as zoom lens for animals that wont let you get very close, macro lens for bugs etc). Animal appearances will vary based on animal rarity and preferences (biome, season, weather). Photos taken by the player can be saved to the nature journal, where each different type of animal has their own entry with basic information about it, and the date of first observation. 

Gameflow   |  System loop
:-------------------------:|:-------------------------:
 <img src="https://github.com/user-attachments/assets/86d81ee2-e5f8-4c7f-b676-c308e7313998" width="500"></img>  |   <img src="https://github.com/user-attachments/assets/af8d92f9-8f9c-4bc3-a815-b4237669c997" width="500"></img>


### Minimum Viable Product
1. UI / Main menu
2. Nature area 1
3. Photography mechanic
4. Nature journal
5. Basic animal behaviour & animation
6. Store screen & gear upgrades
7. Gear screen
8. Pause menu

More (if ahead of schedule)
- Complex animal behaviour
- More nature areas & animals
- Map screen
- More upgrades
- Journal sorting
