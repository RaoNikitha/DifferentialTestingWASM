;; 1. Create a test where the `if` condition never evaluates to true due to a mismanaged operand stack leading to inconsistent CFG. This tests the ability of implementations to handle conditions that never execute the `then` block correctly.

(assert_invalid
  (module
    (func $if-unreachable-condition-mismatch (param i32) (result i32)
      (if (result i32) (unreachable)
        (then (i32.const 1))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)