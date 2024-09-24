;; 3. **Test with Conditionals in Nested Blocks**:     - Implement a nested block structure where conditional branches (e.g., `if` and `else` statements) contain `nop` instructions. Validate that the control flow correctly navigates through the conditional branches.    - This test verifies the handling of control flow through conditionals surrounded by nested blocks, ensuring `nop` placements don't disrupt branching logic.

(assert_invalid
  (module
    (func $test (param $x i32)
      (block $outer
        (block $inner
          (if (local.get $x)
            (then (nop)
                  (br $inner))
            (else (nop)
                  (br $outer))
          )
        )
      )
    )
  )
  "unexpected end of section or function"
)