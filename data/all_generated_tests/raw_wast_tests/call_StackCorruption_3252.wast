;; **Test 1**: Call a function with more arguments than it expects. - **Constraint Checked**: Consistency in argument handling. - **Stack Corruption Risk**: Over-pushing arguments might overflow the stack in the wizard_engine due to improper bounds checking, leading to corrupting subsequent stack operations.

(assert_invalid
  (module
    (func $test_func (param i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
    (func (call $test_func (i32.const 1) (i32.const 2) (i32.const 3)))
  )
  "type mismatch"
)