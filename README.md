## Requirements:
* [Game Maker 8.2](https://gm82.cherry-treehouse.com/#Downloads)
* [sysInput 0.9.0](https://gitlab.com/-/project/61833387/uploads/80abcd5d94e9f6335c52c3cf8eb1a127/sysInput.gex)

### How to install sysInput:
* Open the AstralEngine82.gm82
* Extensions(beneath Game Settings)->Manage->Install->Locate the sysInput.gex

## FAQ
**How do i install GameMaker 8.2?**  
Open this https://gm82.cherry-treehouse.com/#Downloads , "Download Setup Wizard" -> "DOWNLOAD". Once your download is done, execute the setup and proceed with it until it's installed. Once that's done, look at the tutorial at the top explaining how to install sysInput.


**Can you port this to the new GameMaker / GameMaker Studio 2?**  
No. Astral Engine uses alot of GameMaker 8.2 room specific features, such as fields and custom previews. Porting it to current GameMaker would mean working with a worse room editor that doesn't meet the engine needs. 

If you really want to use new GameMaker, you can use [Astral Physics for GameMaker 2024+](https://gitlab.com/astralengine/astralphysics), or port the physics controller to a new standalone project, but that means that you will only have the player physics and will need to reimplement the other features.


**Can you add this character?**  
No. Adding characters increases complexity by alot, for example when adding a new animation, you would need to create an animation for all characters.  
The only exception is Super Sonic, which reuses Sonic’s animations.  

**Can I make a game using this?**  
Yes! The license permits you to do anything, including fangames, commercial projects and forks.

**How do i install sysInput?**  
There's a tutorial at the top explaining the steps to install sysInput. The extension itself comes with the source code, inside the extensions folder.