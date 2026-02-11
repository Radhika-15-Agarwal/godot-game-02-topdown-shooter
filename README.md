Top-Down Shooter

A small but complete top-down 2D shooter built in Godot 4 as part of a game development learning series.

The player moves freely around the screen, aims with the mouse, and survives against enemies that chase and spawn at an increasing rate. The project focuses on implementing a clean gameplay loop and structured game state management.

Features:
- Top-down movement using CharacterBody2D
- Mouse-aimed shooting
- Configurable fire rate system
- Enemy AI with player tracking
- Bullet–enemy collision handling
- Kill-based scoring
- Session high score tracking
- Dynamic difficulty scaling
- Game over and restart system via a global GameManager
- UI that observes game state cleanly

Controls:
- Arrow Keys – Move
- Mouse – Aim
- Shoot key (configured action) – Fire bullets
- Restart key (configured action) – Restart after game over

Architecture Overview:
- GameManager (Autoload) handles:
  - Game state (running / game over)
  - Restart logic
  - Score and high score storage
- Gameplay logic is separated from UI logic.
- UI updates are state-driven rather than manually triggered.
- Pause compatibility handled using PROCESS_MODE_ALWAYS.

What I Learned:
- Structuring a complete gameplay loop in Godot
- Managing global state using Autoload singletons
- Implementing cooldown systems (fire rate)
- Handling pause and restart edge cases properly
- Avoiding state re-entrancy bugs
- Separating gameplay systems from UI systems
- Refactoring for cleaner architecture mid-project

Future Improvements:
- Persistent high score saved to disk
- Additional enemy types
- Sound effects and music
- Visual effects (screen shake, hit flash)
- Main menu and difficulty selection
