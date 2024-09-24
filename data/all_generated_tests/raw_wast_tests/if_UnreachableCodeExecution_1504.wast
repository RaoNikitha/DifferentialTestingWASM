;; Define a `block` with an `if` condition that directly leads to an `unreachable` instruction, testing whether the validation mechanism prevents entering unreachable code on false conditions.

(assert_invalid
  (module (func $unreachable-if (result i32)
    (block (if (result i32) (i32.const 1) (then unreachable) (else (i32.const 0))))
  ))
  "type mismatch"
)