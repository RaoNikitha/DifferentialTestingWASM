;; 7. Create nested functions where each subsequent function calls the previous one. Validate if deep nested calls are handled correctly and the control returns to the initial caller.

(assert_invalid
  (module
    (func $f1 (call $f2))
    (func $f2 (call $f3))
    (func $f3 (call $f4))
    (func $f4 (call $f5))
    (func $f5)
  )
  "type mismatch"
)