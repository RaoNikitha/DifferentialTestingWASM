;; 1. Place an `unreachable` instruction inside a block that is supposed to return an `i32`, but intentionally follow it with `i64` producing instructions. Verify if the engine traps correctly due to type mismatch upon block exit.

(assert_invalid
  (module (func $type-mismatch-after-unreachable (result i32)
    (block (result i32) (unreachable) (i64.const 42))
  ))
  "type mismatch"
)