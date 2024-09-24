;; 2. Design a function that contains an `unreachable` instruction right before its `return` instruction. Test whether this function causes an immediate trap upon reaching the `unreachable` instruction or improperly returns a value.

(assert_invalid
  (module (func $type-unreachable-before-return (result i32)
    (unreachable)
    (return (i32.const 0))
  ))
  "unreachable executed"
)