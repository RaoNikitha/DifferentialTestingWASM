;; 9. **Test 9: Dynamic Type Check on the Stack**:    Perform dynamic type checking in the middle of stack operations. Push mixed data types before the `call_indirect`. Ensure that the handling maintains stack order integrity and traps when a type mismatch is detected.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 f64) (result i32)))
    (table 1 funcref)
    (func $callee1 (type 0) (param i32) (result i32) ;; dummy function
      local.get 0
    )
    (func $callee2 (type 1) (param i32 f64) (result i32) ;; another dummy function
      local.get 0
    )
    (elem (i32.const 0) $callee1 $callee2)
    (func (export "main")
      (i32.const 42)
      (i32.const 1)
      (f64.const 3.14)
      (call_indirect (type 0) (i32.const 1)) ;; should trap due to type mismatch
    )
  )
  "type mismatch"
)