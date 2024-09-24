;; 1. **Test Invalid Table Index with Accurate Stack Handling**:    - Test a `call_indirect` instruction with an out-of-bounds table index but with the correct function signature on the stack.    - Checks for: Whether the implementations properly trap on invalid table indices while ensuring the operand stack is consistent.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test_func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 10))
    )
    (elem (i32.const 0) $test_func)
    (func $type-invalid-index
      (call_indirect (type 0) (i32.const 2) (i32.const 0))
    )
  )
  "out of bounds table index"
)