;; 5. **Test 5: Return from Partially Executed Block in Imported Function**    - Description: Import a function containing a block of code with an early return instruction and verify the correctness when this function is called from another module.    - Relation: Ensure that control flow within blocks using return instructions is properly unwound and handled across modules.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func $caller
      (call $imported_func)
    )
  )
  "type mismatch"
)