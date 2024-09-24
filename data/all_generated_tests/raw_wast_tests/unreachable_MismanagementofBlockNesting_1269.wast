;; 10. **Test: Unreachable in Sequence with Loop Exits**    - **Description:** Create nested loops where `br` instructions target specific loop depths while placing `unreachable` within these loops. Verify subsequent instructions do not execute after encountering `unreachable`.    - **Constraint Checked:** Ensures correct handling of loop exits in the presence of `unreachable`.    - **Relation to Mismanagement of Block Nesting:** Tests correct handling of control flow within nested loops and proper response to `unreachable`.

(assert_invalid
  (module
    (func $test-loop-unreachable
      (loop (result i32)
        (block (br 1 (i32.const 1)))
        (unreachable)
      )
      (i32.const 2)
    )
  )
  "type mismatch"
)