;; Test 6: Construct an `if` block where the operand stack contains an `i32` before the `else` block, but the `else` block expects an `i64`, causing inconsistencies in stack type management.

(assert_invalid
  (module
    (func $stack-type-mismatch (result i64)
      (if (result i64)
        (i32.const 1)
        (then (i64.const 10))
        (else (i64.const 20))
      )
    )
  )
  "type mismatch"
)