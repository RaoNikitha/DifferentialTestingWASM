;; 2. Create a nested loop where the inner loop breaks correctly but the outer does not due to operand stack mismanagement, resulting in an infinite outer loop.

(assert_invalid
  (module (func $nested-loop
    (loop (result i32)
      (i32.const 0)
      (loop
        (br 1)
      )
      (drop)
      (i32.const 1)
    )
  ))
  "type mismatch"
)