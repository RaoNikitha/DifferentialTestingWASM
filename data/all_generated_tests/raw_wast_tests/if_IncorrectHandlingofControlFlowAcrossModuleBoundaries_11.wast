;; 2. **Test Description**: Evaluate an `if` block with nested `call` instructions to functions from different modules. The `else` branch calls another imported function. If context handling is wrong, this can cause mismatched stack heights.    - **Constraint Checked**: Correct context propagation and stack alignment across nested module calls.    - **Test Relation**: Identifies if returning from nested calls maintains correct stack states.

(assert_invalid
  (module
    (import "mod" "ext_func" (func $ext_func (param i32) (result i32)))
    (func $type-nested-call-stack 
      (result i32) 
      (if (result i32) 
        (local.get 0) 
        (then 
          (call $ext_func (i32.const 1))
        ) 
        (else 
          (call $ext_func (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)