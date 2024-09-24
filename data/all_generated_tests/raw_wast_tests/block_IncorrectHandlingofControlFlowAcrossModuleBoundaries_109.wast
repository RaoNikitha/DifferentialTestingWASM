;; 10. **Imported Function Call Sequences in Immediate Block Labels**    - Sequential calls to imported functions within the immediate block label regions and confirm the orderly stack and return state.    - Ensures that the sequence of calls and their individual returns are coherently maintained, focusing on label stack management.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test_invalid_call_sequence
      (block (result i32)
        (call $external_func (i32.const 10))
        (call $external_func (i32.const 20))
        (br 0 (i32.const 5))
      )
    )
  )
  "type mismatch"
)