;; 7. **Test for Type Mismatch caused by an Unreachable Instruction**: Generate a module with an `unreachable` instruction in a `then` block followed by a value-producing instruction that doesn’t match the `blocktype`. This examines if unreachable instructions are properly disregarded in type validation.

(assert_invalid
  (module (func $type-unreachable-mismatch (if (result i32)
    (i32.const 1)
    (then (unreachable) (f32.const 2.0))
    (else (i32.const 3))
  )))
  "type mismatch"
)