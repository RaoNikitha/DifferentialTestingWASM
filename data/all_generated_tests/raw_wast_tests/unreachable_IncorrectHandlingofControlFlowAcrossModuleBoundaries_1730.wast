;; 1. **Test Description:**    Import a function from another module that contains an `unreachable` instruction and call it from the main module. Check if both implementations consistently trap without executing any further instructions.

(assert_invalid
  (module
    (import "test" "unreachable_function" (func $unreachable_function))
    (func (call $unreachable_function) (i32.const 0))
  )
  "type mismatch"
)