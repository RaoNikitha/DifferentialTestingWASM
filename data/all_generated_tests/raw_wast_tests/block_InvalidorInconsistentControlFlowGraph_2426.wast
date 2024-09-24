;; 7. Create a block that includes sub-blocks with invalid or unreachable code paths due to improper end bracketing, ensuring that misbracketing is caught and correctly flagged without generating inconsistent CFGs.

(assert_invalid
  (module (func $improper-end-bracketing
    (block (block (i32.const 1) (i32.const 2))
    (end (i32.const 3)))
  ))
  "type mismatch"
)