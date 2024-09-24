;; 9. Implement a `loop` where the block type specifies a floating-point result type but the loop's body contains instructions only valid for integer types, checking for mismanagement of type constraints within control flow.

(assert_invalid
  (module (func $mismatch_types
    (loop (result f64)
      (i32.const 1)
      (i32.const 2)
      (br 0)
    )
  ))
  "type mismatch"
)