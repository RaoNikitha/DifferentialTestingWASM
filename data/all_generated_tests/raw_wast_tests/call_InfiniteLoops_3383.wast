;; 2. **Nested Loops with Multiple Call Instructions Missing Arguments**: Design nested loops with multiple call instructions where each call is meant to consume specific arguments. Ensure that some call invocations are missing necessary arguments. This checks the stack argument consumption integrity across nested loops.

(assert_invalid
 (module
  (func $nested-loops-missing-arguments
   (loop
    (call 1)
    (loop
     (call 1 (i32.const 1))
    )
   )
  )
  (func (param i32 i32))
 )
 "type mismatch"
)