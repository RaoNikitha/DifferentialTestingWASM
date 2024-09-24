;; ```  Test 1: Define a function with a loop that uses `call_indirect` to call another function within the loop. Check for infinite looping behavior, where the loop does not terminate due to possible mismatched function signatures.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $callee (param i32) (call_indirect (type 1) (i32.const 0)))
    (func (param i32) (block (loop (call_indirect (type 0) (i32.const 0)))))
  )
  "type mismatch"
)