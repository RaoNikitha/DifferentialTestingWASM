;; 3. **Test 3: Return from Imported Function within If-Then Block**:    - Description: Test the return from an imported function called within the `then` block of an `if` instruction, checking the correct unwinding of the stack and return value handling.    - Specific Constraint: Ensure that the return values match the `blocktype` and that the stack maintains its integrity post-return.    - Relation to Control Flow: Validates correct stack unwinding and control transfer on return from external module function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test-function (result i32)
      (if (result i32) (i32.const 1)
        (then (call $external_func))
        (else (i32.const 42))
      )
    )
  )
  "type mismatch"
)