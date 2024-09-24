;; 1. **Inter-Module Function Return Stack Handling**:    - Import a function from another module that returns multiple values. Ensure the calling function can properly restore the stack state after the `return` instruction is executed.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32 i32)))
    (func $test_func (result i32)
      call $external_func
      (return)
    )
  )
  "type mismatch"
)