;; 6. **Test for Calling Function with Nested Calls**:    - **Description**: Create a function that calls another function which calls another function, and so on, forming a nested call chain.    - **Constraint Checked**: Proper handling of nested function calls and stack frames.    - **CFG Relevance**: Validates accurate recording and unwinding of function call frames in CFG.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (param i32) (result i32)))
    (func $g (type $sig1) (i32.const 42))
    (func $f (type $sig2) (param i32) (call $g))
    (func $type-nested-calls
      (call $f (i32.const 1))
    )
  )
  "type mismatch"
)