;; 1. **Test CFG Handling with Nested Calls**:    - Call a function indirectly with valid `funcref` but include nested `call_indirect` instructions inside the function.    - The nested `call_indirect` instructions should have a mixture of valid and out-of-bounds indices.    - This test checks if the inner call instructions are correctly managed and indexed within the CFG, ensuring no invalid jumps or unreachable code.

(assert_invalid
  (module
    (func $func1 (param i32) (result i32)
      (i32.const 42)
    )
    (func $func2 (param i32) (result i32)
      (call_indirect (type 0) (i32.const 0))   ;; inner call_indirect with valid index
    )
    (type $type0 (func (param i32) (result i32)))
    (table funcref (elem $func1 $func2))
    (func $test_func (param i32) (result i32)
      (call_indirect (type 0) (i32.const 1))   ;; outer call_indirect referring to $func2
    )
    (export "test" (func $test_func))
  )
  "type mismatch"
)