;; 6. **Branched Return With Unreachable Post Branch**:    - Implement branching that goes to a block with a `return` and ensures pathways that should not logically reach the `return` will hit `unreachable`.    - This checks if branches are correctly manipulated and don't lead erroneously to `unreachable` after stack unwinding.

(assert_invalid
  (module
    (func $branched-return-with-unreachable (result i32)
      (block
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (unreachable)
        (return)
      )
    )
  )
  "type mismatch"
)