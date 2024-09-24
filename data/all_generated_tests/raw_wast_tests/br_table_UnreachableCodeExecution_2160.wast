;; 10. **Test Description**: A `br_table` within an `if` block, with one branch setting up an operand type causing a type mismatch when entering the `br_table` and leading to an `unreachable` instruction if the type doesn’t align with any labels or default. This examines conditional type consistency checks.

(assert_invalid
  (module
    (func $conditional-type-mismatch
      (block
        (i32.const 1)
        (if
          (then
            (block (br_table 0 1 (i32.const 0)))
          )
          (else
            (block (result i64) (br_table 0 (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)