This comparison is work in progress, and the basis for much of this data is not yet fully researched!

It is intended to answer the question "What does awe6 do that X doesn't do?" (or vice versa), and not "Which framework is best for project Y?".  For practical deployments it is sometimes appropriate to combine frameworks (e.g. NME + awe6 + Flixel).

If you notice something to be incorrect on this page, or would like to help us complete this analysis, please let us know by adding a comment below.

### Key ###

  * -: No support
  * D: Delegated (i.e. proxied to a supporting library)
  * L: Low-level Support (i.e. direct, no semantics)
  * A: Abstraction Layer (i.e. elaborate, expressed with context)

### Platform Portability ###

Please note, not all examples claim to be multi-platform.

| | **awe6** | **Flixel** | **FlashPunk** | **NME** | **Unity3D** |
|:|:---------|:-----------|:--------------|:--------|:------------|
| **SWF/AIR** | D        | L          | L             | L       | D           |
| **HTML5** | D        | -          | -             | L       | -           |
| **Native** | D        | -          | -             | L       | L           |

### Game Services ###

Please note, not all examples claim to be game specific.

| | **awe6** | **Flixel** | **FlashPunk** | **NME** | **Unity3D** |
|:|:---------|:-----------|:--------------|:--------|:------------|
| **Game State** | A        | A          | A             | -       | A           |
| **User Input** | A        | A          | A             | L       | A           |
| **Assets** | A        | D          | D             | L       | L           |
| **Sounds** | A        | A          | A             | L       | A           |
| **2D** | D        | L          | L             | L       | -           |
| **3D** | D        | -          | -             | -       | A           |
| **Physics** | D        | A          | D             | -       | A           |
| **Networking** | D        | D          | D             | L       | L           |

### Entity Framework ###

Please note, not all examples claim to be entity frameworks.

| | **awe6** | **Flixel** | **FlashPunk** | **NME** | **Unity3D** |
|:|:---------|:-----------|:--------------|:--------|:------------|
| **Global FSM** | A        | ?          | A             | -       | L           |
| **Entity FSM** | A        | ?          | -             | -       | -           |
| **Nested Entities** | A        | ?          | -             | -       | A           |
| **Messages** | A        | ?          | ?             | L       | L           |
| **Type Safe Database** | A        | ?          | -             | -       | L           |

## More Frameworks ##

To review and add to the list:

  * awe6
  * Flixel
  * FlashPunk
  * PBE
  * NME
  * GM2D
  * Hydrax
  * Cocos2D
  * Unity3D
  * GameMaker
  * NPlay
  * Spaceport.io
  * Sparrow
  * FlashJS
  * libGDX
  * AndEngine