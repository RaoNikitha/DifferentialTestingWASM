;; 8. **Test 8: Branch from Within `nop`-Filled `if` Block**:    - **Description**: Use an `if` block filled with `nop` instructions before branching out with `br_if`. Validate that the `if` condition and branch target resolution work as intended.    - **Constraint**: The presence of `nop` within the `if` block must not affect the conditional branch.    - **Relation to Incorrect Branch Target Resolution**: Ensures the correct resolution of conditional branches from `if` blocks with `nop`.

(assert_return
  (invoke "run")
  (i32.const 1)
)

(module
  (func $expect_1 (result i32)
    (if (i32.const 1)
      (then
        nop
        nop
        (br_if 0 (i32.const 0))
        (i32.const 1)
      )
      (else
        (i32.const 0)
      )
    )
  )
  (export "run" (func $expect_1))
)