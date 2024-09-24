;; 5. **Test Mismatched `br` in `else` Branch**:    In an `if-else` construct, provide a `br` in the `else` branch that targets the `if` block's enclosing construct. Verify it does not inadvertently jump to the wrong block.    - **Constraint**: The label should not conflict between branches and resolve to the `if` block correctly.    - **Expectation**: `br` should resolve based on the scope correctly even from the `else` branch.

(assert_invalid
  (module
    (func $mismatched-br-in-else
      (block
        (i32.const 0)
        (if (then (nop)) (else (br 1)))
      )
    )
  )
  "unexpected label"
)