;; 1. Test an `if` block with an `else` branch where the condition is always false, ensuring no instructions within the `if` branch are ever executed, focusing on CFG's handling of skipped branches.

(assert_invalid
  (module
    (func $if_else_unreachable
      (i32.const 0)
      (if (result i32)
        (then
          (unreachable)
        )
        (else
          (i32.const 42)
        )
      )
    )
  )
  "type mismatch"
)