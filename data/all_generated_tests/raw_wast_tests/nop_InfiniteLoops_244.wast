;; 5. **Test 5: Complex Nested Loop with Multiple `nop` Instructions**:    - **Description**: A nested set of loops where both the inner and outer loops contain several `nop` instructions.    - **Constraint**: Validate that `nop` does not interfere with correct nesting and control flow between multiple loops.    - **Relation to Infinite Loops**: Observes if nested loops with `nop` fail to terminate correctly, causing an infinite loop.    - **Example**: `(loop $L1 (nop) (loop $L2 (nop) (br_if $L2 (i32.const 0)) (br $L1)) (nop))`

(assert_invalid
  (module
    (func $complex-nested-loop
      (loop $L1
        (nop)
        (loop $L2
          (nop)
          (br_if $L2 (i32.const 0))
          (br $L1)
        )
        (nop)
      )
    )
  )
  "loop error"
)