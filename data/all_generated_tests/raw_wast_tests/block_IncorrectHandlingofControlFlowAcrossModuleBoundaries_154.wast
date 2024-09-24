;; 5. **Conditional Branch with Cross-Module Function Call**:    - Create a function within a module that uses a `block` with a conditional branch (`br_if`) followed by a call to an imported function. Test that both implementations handle the label indexing and stack management properly after the conditional branch and function call.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test
      (block (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (call $external_func (i32.const 42))
      )
    )
  )
  "type mismatch"
)