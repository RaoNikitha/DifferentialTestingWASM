;; 3. Create an invalid `loop` with an incorrect `blocktype` that pushes incorrect values onto the stack and check for proper error handling and stack unwinding without corruption or leaks.

(assert_invalid
  (module (func $invalid-loop-blocktype
    (result i32)
    (loop (result f32) (i32.const 0))
  ))
  "type mismatch"
)