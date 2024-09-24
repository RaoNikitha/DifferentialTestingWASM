;; 2. **`nop` in Nested Control Structures**:    - Place `nop` instructions within nested `block`, `loop`, and `if` structures. Validate if the implementations can handle deeply nested yet functionally empty control flow with `nop`.    - Constraint: Examines the CFG’s ability to maintain structural integrity without influencing nesting levels.

(assert_invalid
  (module
    (func $test-nested-nop
      (block
        (loop
          (if (i32.const 1)
            (then (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)