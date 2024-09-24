;; 8. **Test Description:**    - **Test Name:** Forward Branch in Imported Function Test    - **Objective:** Check if forward branches within imported functions are correctly handled by the `br` instruction.    - **Constraint:** Ensures forward branches targeting labels within the same imported function are executed correctly.    - **Relation to Incorrect Handling:** Prevents potential errors in branching and label indexing within imported functions.

(assert_invalid
  (module
    (import "env" "external_func" (func $imported_func))
    (func $test_func
      (block
        (call $imported_func)
        (br 1))
    )
  )
  "unknown label"
)