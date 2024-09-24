;; 4. **Mismatched Operand Types in Backward Branches:**    - **Test Description:** Create a loop that expects specific operand types and use a `br` instruction to jump back to the loop. Ensure that consumed operands differ in type from the loop’s input types to test type conformance.    - **Constraint Tested:** Operand type matching for loops.    - **CFG Relevance:** Incorrect operand types can distort the CFG, leading to misalignment between expected and actual flow states within loops.

(assert_invalid
  (module
    (func $mismatched-operand-types-backward-branch
      (loop (param i32) (result i32)
        local.get 0
        i64.const 1
        br 0
      )
    )
  )
  "type mismatch"
)