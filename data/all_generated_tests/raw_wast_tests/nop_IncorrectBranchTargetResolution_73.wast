;; 4. **Conditional Branching and `nop`:**    - **Description**: Implement an `if-else` structure with `nop` in both branches. Use `br_if` to conditionally jump, ensuring the jump is executed correctly.    - **Constraint Checked**: Verifies that `nop` instructions do not affect the condition and target resolution of `br_if`.    - **Relation to Incorrect Branch Target Resolution**: Ensures conditional branches skip over `nop` accurately.

(assert_invalid
  (module
    (func $conditional-branching-and-nop
      (result i32)
      (local $cond i32)
      (if (local.get $cond)
        (then (nop) (i32.const 1))
        (else (nop) (i32.const 0))
      )
      (br_if 0 (i32.const 1))
      (i32.const 2)
    )
  )
  "type mismatch"
)