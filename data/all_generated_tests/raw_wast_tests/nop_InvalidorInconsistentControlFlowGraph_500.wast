;; 1. **Test 1: Excessive NOPs in a Loop**    - **Constraint Check**: Verify that multiple `nop` instructions within a loop do not alter the loop's control flow.    - **Description**: Create a loop that includes several `nop` instructions consecutively. Ensure the loop continues to execute its defined iterations without any unexpected breaks or skips.

(assert_invalid
  (module
    (func $many-nops
      (loop
        (nop)
        (nop)
        (nop)
        (nop)
        (br 0)
      )
    )
  )
  "type mismatch"
)