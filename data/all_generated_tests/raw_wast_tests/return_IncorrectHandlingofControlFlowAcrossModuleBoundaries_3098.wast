;; 7. **Test 7: Incorrect Block Targeting**   Create nested functions across two modules where a return from an imported function mistakenly targets an intermediate block. Check both engines' behavior to see how they handle incorrect block targeting.   **Constraint**: Ensure the `return` instruction correctly identifies and returns to the correct outermost block.   **Relation to Incorrect Handling of Control Flow**: Misidentifying target blocks can result in incorrect function termination.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $incorrect_block_targeting (result i32)
      (block
        (call $external_func)
        (return)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)