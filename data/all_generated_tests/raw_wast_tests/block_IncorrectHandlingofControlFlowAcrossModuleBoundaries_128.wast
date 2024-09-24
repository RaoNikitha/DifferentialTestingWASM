;; 9. Define a `block` calling two imported functions in sequence, where the first function alters the stack in a way that the second function's execution is dependent on. This verifies if proper stack management is ensured across multiple module calls within the block.

(assert_invalid
  (module 
    (import "env" "alter_stack" (func $alter_stack (param i32) (result i64)))
    (import "env" "dependent_func" (func $dependent_func (param i64) (result i32)))
    (func $test 
      (block (result i32) 
        (call $alter_stack (i32.const 1)) 
        (call $dependent_func (get_local 0))
      )
    )
  )
  "type mismatch"
)