;; 4. **Test 4**:    - Multiple `if` blocks, one inside another, each with distinct block types and no `else`.    - Checks the consistency in managing stack height and types through several nested conditional branches.

(assert_invalid
  (module
    (func $nested-if-blocks
      (if (result i32)
        (i32.const 1)
        (then
          (if (result f64)
            (i32.const 1)
            (then (f64.const 0.0))
          )
        )
      )
    )
  )
  "type mismatch"
)