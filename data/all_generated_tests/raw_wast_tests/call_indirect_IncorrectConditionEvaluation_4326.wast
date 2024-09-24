;; 5. **Test 5**: Provide additional operands on the stack that exceed the requirements for the function signature to be called by `call_indirect`. Validate that the implementations handle the extra operands appropriately, ensuring they do not cause incorrect stack manipulations or errors.

(assert_invalid
  (module
    (type $sig (func (param i32) (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 10))
    )
    (elem (i32.const 0) $f)
    (func $test
      (i32.const 0)
      (i32.const 0)
      (i32.const 0) ;; extra operand
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "extra operands on stack"
)