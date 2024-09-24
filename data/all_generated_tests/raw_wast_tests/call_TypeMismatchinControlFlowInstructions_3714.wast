;; 3. Nested calls within an `if-then-else` instruction where the `then` and `else` blocks have differing types, and the wrong type is evaluated based on the condition.

(assert_invalid
  (module
    (func $type-mismatch-condition (param i32) (result i32)
      (local i32)
      (if (result i32)
        (local.get 0)
        (then
          (call 0 (i32.const 1) (i32.const 2))
        )
        (else
          (call 1 (i32.const 1))
        )
      )
    )
    (func (param i32 i32) (result i32))
    (func (param i32) (result i32))
  )
  "type mismatch"
)