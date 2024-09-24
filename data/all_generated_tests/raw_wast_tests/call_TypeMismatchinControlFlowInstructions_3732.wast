;; 1. **Mismatch in Function Signature Within Loop**:    - **Description**: Create a loop instruction that calls a function with a signature expecting a float and returning an integer, but provide an integer argument on the stack before the call.    - **Reasoning**: This will test the type consistency within loops, checking if the implementation correctly enforces argument types for the called function.    - **Constraint**: The test should trigger an ArityMismatch or TypeMismatch error due to the type disparity within the loop context.    - **Relation**: Ensures proper handling and type validation of arguments within loop control flow.

(assert_invalid
  (module
    (func $loop-call-type-mismatch
      (loop
        (i32.const 42) ;; Pushing integer onto stack
        (call 1) ;; Function expects a float, returning an integer
      )
    )
    (func (param f32) (result i32))
  )
  "type mismatch"
)