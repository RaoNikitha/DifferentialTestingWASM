;; 8. **Test Valtype Handling in Loop**: A loop with improper value types pushed onto the stack, with `br` intended to exit the loop. Validate value type mismatches to ensure correct stack handling during loop iterations and proper exit from the loop.

(assert_invalid
 (module (func $valtype-mismatch-loop
   (i32.const 1)
   (loop (param f32) (drop) (br 0))
   (drop)
 ))
 "type mismatch"
)