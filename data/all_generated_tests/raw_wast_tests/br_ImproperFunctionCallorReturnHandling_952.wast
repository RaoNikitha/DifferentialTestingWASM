;; 3. **Test 3: `br` Instruction within Function Returning to Caller**    - **Description:** Add a `br` instruction inside a function that returns to the function caller. Check if the operand stack is correctly managed throughout the branch and return.    - **Reasoning:** Examines if the branch instruction within a function correctly interacts with the stack and return points.

(assert_invalid
  (module
    (func $br-within-return
      (return (br 0))
      (i32.const 0) (drop)
    )
  )
  "type mismatch"
)