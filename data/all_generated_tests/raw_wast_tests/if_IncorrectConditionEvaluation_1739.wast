;; 10. **Condition with State Change Between Checks**: Create a test where the condition is influenced by state changes between multiple checks within the same `if` block. Ensure the state changes should consistently affect the condition evaluation. Verify if an implementation inconsistently handles state changes affecting condition evaluations, leading to incorrect branches.

(assert_malformed
  (module quote
    "(func (local i32)"
    "  (i32.const 1)"
    "  (set_local 0)"
    "  (i32.const 0)"
    "  (if (result i32)"
    "    (i32.const 0)"
    "    (local.set 0 (i32.const 1))"
    "    (local.get 0)"
    "    (then (local.get 0))"
    "    (else (i32.const 0))"
    "  )"
    ")"
  )
  "unexpected token"
)