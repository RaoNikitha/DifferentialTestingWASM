;; 6. **Test Case 6: Unreachable after Return from Imported Function**    - **Description:** Module A imports a function from Module B that returns a value. Immediately after the call in Module A, place the `unreachable` instruction. This test checks if the return value handling and subsequent trap execution work correctly across modules.

(assert_invalid
  (module
    (import "B" "func" (func $imported (result i32)))
    (func (unreachable) (call $imported))
  )
  "type mismatch"
)