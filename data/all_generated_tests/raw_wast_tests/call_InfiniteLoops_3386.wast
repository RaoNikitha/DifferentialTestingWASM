;; 5. **Loop with Multiple Function Calls Consuming Different Argument Types**: Create a loop with calls to multiple functions, each expecting different argument types. Ensure the types on the stack do not match the expected types. This stresses type and argument validation within loops.

(assert_invalid
  (module
    (func $loop-with-multiple-calls
      (block (loop (br_if 0 (i32.const 0))))
      (call 1) ;; call with missing arguments
      (call 2) ;; incorrect argument type
    )
    (func (param f32) (result i32) (i32.const 0))
    (func (param i64) (result i32) (i32.const 0))
  )
  "type mismatch"
)