;; Use an `if` instruction with multiple nested `if-else` branches to ascertain if all false branches lead to valid code paths and do not inadvertently execute an `unreachable` instruction.

(assert_invalid
  (module (func $nested-if-else-types (result i32 i32)
    (if (result i32 i32) (i32.const 0)
      (then (i32.const 1) (i32.const 2))
      (else
        (if (result i32 i32) (i32.const 0)
          (then (i32.const 3) (i32.const 4))
          (else (unreachable))
        )
      )
    )
  ))
  "type mismatch"
)