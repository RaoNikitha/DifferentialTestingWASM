;; 4. **Test 4: Return from Imported Function within If-Else Block**:    - Description: Test the return from an imported function called within the `else` block of an `if` instruction, checking for proper stack and label management.    - Specific Constraint: Validate that the `else` block properly processes the return values and stack as per `blocktype` specifications.    - Relation to Control Flow: Tests proper control and stack management when returning from functions across module boundaries within `else`.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $type-return-imported-func-in-else-block (param i32) (result i32)
      (local i32)
      (if (result i32)
        (i32.const 1)
        (then
          (local.set 0 (i32.const 42))
        )
        (else
          (local.set 0 (call $imported_func))
        )
      )
      (local.get 0)
    )
  )
  "type mismatch"
)