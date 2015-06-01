# Example Game Genres viewed through awe6 #

By way of example, we list some familiar games, and how their respective components may be described in awe6 terminology.  Longer term objective is to include a sample tutorial for each.

### Paddle & Ball / Pong ###

IAssetManager provides graphics for a bat, a ball, a font for a score, a sound for a deflection.
The following IScenes & IEntities are defined:

  * Intro Scene shows a logo and a "start" button Entity.  Default next scene is Game.
  * Game Scene houses score, a ball, 2 bats and a central dividing line.
    * The ball moves itself, checking boundaries & bat collisions each update.  Or contains a bounceable entity which does so.
  * The bats contain their own IInputJoypads which determine movement up or down.
  * The Game Scene awards points and declares a winner based on the position of the ball.
    * Overlay provides pause, mute and exit functionality.

### Adventure Game / Colossal Cave ###

Soon ...

### Beat-em-up / Street Fighter ###

Soon ...

### Platformer / Mario Bros ###

Soon ...

### 3D Racing Game / Ridge Racer ###

Soon ...

### Real Time Strategy / Command & Conquer ###

Soon ...

### Simulation / Sim City ###

Soon ...

### Shoot-em-up / Quake ###

Soon ...

### Pattern-repetition / Guitar Hero ###

Soon ...

### Monkey Tennis ###

Soon ...