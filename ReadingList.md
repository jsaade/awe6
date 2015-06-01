Rather than being a games development kit (GDK) awe6 is _just_ a framework.  You won't find inbuilt spritesheet, physics or 3D capabilities - that's the fun stuff, go write it or connect other great existing libraries together using awe6!  Instead awe6 provides a skeleton you can rely on ... here's some of the research that went into it's design:

Lots of insights into Entity composition:
  * http://stackoverflow.com/questions/202166/how-does-a-game-engine-that-models-objects-as-collections-of-components-work-at

Common terminologies and interfaces with existing game APIs such as:
  * XNA API: http://msdn.microsoft.com/en-us/library/bb203940.aspx
  * Unity API: http://unity3d.com/support/documentation/ScriptReference/Component.html

High level best practices:
  * OOP Game Design: http://devmaster.net/posts/2820/object-oriented-game-design
  * States: http://www.icad.puc-rio.br/~lvalente/docs/2006_sbgames.pdf
  * Interface injection: http://martinfowler.com/articles/injection.html
  * SOLID: http://en.wikipedia.org/wiki/Solid_(object-oriented_design)
  * Functional Reactive Programming: http://en.wikipedia.org/wiki/Functional_reactive_programming

And ideas supported by others' commercial experience:
  * http://cowboyprogramming.com/2007/01/05/evolve-your-heirachy
  * http://www.rivermanmedia.com/programming/6-programming/20-object-oriented-game-programming-the-behavior-system
  * http://cheezeworld.com/game-structure/

And, if you're a big fan of theory, you might want to know that awe6 intentionally falls short of the final destination of Entity Systems (thus avoiding going full circle back to key based data):
  * http://t-machine.org/index.php/2007/12/22/entity-systems-are-the-future-of-mmog-development-part-3/

Enjoy awe6.