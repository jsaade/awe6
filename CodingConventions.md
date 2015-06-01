# Usability through consistency #

Conventions are important for a consistent experience.  They are intended to improve the readability of the source code and make maintenance and extension easier.

No convention should be considered definitive - many of these choices may not be appropriate outside of the scope of this library.

  * Clear, intuitive, obvious naming.
  * Americanized spelling.
  * Interfaces housed in the `awe6.interfaces` package.
  * Implementation classes housed in the `awe6.core` package.
  * Abstract driver classes housed in the `awe6.core.drivers` package.
  * Platform specific driver packages housed in the `awe6.core.drivers` package.
  * Non-framework essential, but routinely useful, extensions housed in the `awe6.extras` package.
  * Interfaces prefixed by `I`.
  * Abstract classes prefixed by `A`.
  * Enumerators prefixed by `E`.
  * Private scope members prefixed with `_` (with exception of getters & setters).
  * Local scope members prefixed with `l_`.
  * Parameter scope members prefixed with `p_`.
  * Reserved members prefixed with `_`.
  * Enumerated constructors represented as `CONST_CASE`.
  * Some enumerators extensible via `SUB_TYPE( value:Dynamic )`.
  * Helper classes kept private and prefixed with `_Helper`.
  * Direct-context type enumerators publicly scoped and named `type`.
  * Non-direct-context type enumerators named `%context%Type`.
  * Strict typing throughout.
  * All scope clearly defined (e.g. `private`).
  * No uppercase acronyns in `camelCase` or `PascalCase`.
  * New lines for all braces `{}`.
  * Spaces inside paranthesis: `( example )`.
  * All blocks for conditionals, loops, getters, setters etc to be wrapped in braces on new lines.
  * Implicit Getter and Setter methods prefixed with `get_%property%` & `set_%property%` (as per Haxe3 requirement).
  * Getters for all readable interface variables that are not Bool or Enum and relate to state (i.e. are likely to change after initialization).
  * Setters for all writeable interface variables.
  * Bool property names prefixed with `is`, `as`, `has` or `was`.
  * Use of constructor dependency injection.
  * Casting avoided.
  * Two phase initialization avoided.
  * Statics & Singletons eliminated.
  * All Interfaces inline documented for use with [ChxDoc](http://code.google.com/p/caffeine-hx/wiki/ChxDoc).