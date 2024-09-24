;; 3. Define multiple nested `if` and `else` blocks, ending with an `unreachable` instruction inside the deepest `else` block. Validate that proper error handling is executed when the `if` conditions cause a trap.    - **Constraint**: Ensure error handling correctly validates deep nesting.    - **Behavior**: If mismanaged, the trap might not be handled properly, causing a misaligned stack.

(assert_invalid
  (module (func $nested-if-unreachable
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 1)
          (then (i32.const 2))
          (else
            (if (result i32) (i32.const 1)
              (then (unreachable))
              (else (unreachable))
            )
          )
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)