;; 9. Having an `if` block that uses `unreachable` instructions, which unintentionally unwinds the stack and leaves it mismatched regarding the block’s declared result type.

(assert_invalid
  (module (func $type-then-value-unreachable (result i32)
    (i32.const 0)
    (if (result i32)
      (then (unreachable))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)