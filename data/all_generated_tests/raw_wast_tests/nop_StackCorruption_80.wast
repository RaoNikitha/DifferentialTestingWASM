;; 1. A function call followed directly by a `nop` instruction to ensure that the stack state before and after the `nop` remains unchanged, specifically testing for any unwanted stack manipulations.

(assert_invalid
  (module (func $call-and-nop (call $some_func) (nop)))
  "unknown function"
)