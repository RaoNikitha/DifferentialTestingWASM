;; 3. **Test 3**: Trigger a backward branch in `br_table` within nested loops of different types and validate if the backward move correctly matches the operand stack in `wizard_engine`, contrasting it with `WebAssembly`'s processing in the same scenario.

(assert_invalid
 (module
   (func $nested-loops (result i32)
     (loop (result i32)
       (i32.const 10)
       (loop (result i32)
         (br_table 1 0 (i32.const 0))
       )
     )
   )
 )
 "type mismatch"
)