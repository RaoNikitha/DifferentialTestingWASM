;; 5. **Br_Table Out of Bounds to Imported Function**:    - **Description**: Implement a `br_table` instruction within a loop that attempts to branch out of bounds, defaulting to an imported function from module B. Ensure correct control flow and stack state as the default branch target is used.    - **Constraint**: Confirm that the `br_table` handles default transitions to imported functions without corrupting the loop's initialization.

(assert_invalid
  (module
    (import "moduleB" "funcB" (func $importedFunc (result i32)))
    (func $test
      (block $0
        (loop $1 (result i32)
          (br_table $0 $importedFunc (i32.const 3))
        )
      )
    )
  )
  "type mismatch"
)