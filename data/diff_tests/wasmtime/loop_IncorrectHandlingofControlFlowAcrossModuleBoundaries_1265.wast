;; 6. **Nested Loops Calling Imported Function**:    - **Description**: Construct nested loops in a WebAssembly module (A). The inner loop calls an imported function from module B. Test the interaction between nested loops and module boundaries upon the function call.    - **Constraint**: Ensure that both inner and outer loops maintain their state and invariants upon control returning from the nested imported function.

(assert_invalid
 (module
   (import "B" "func" (func $imported_func (result i32)))
   (func $outer_loop (result i32)
     (loop (result i32)
       (loop (result i32)
         (call $imported_func) (br 1))
       (br 1))
   )
 )
 "type mismatch"
)