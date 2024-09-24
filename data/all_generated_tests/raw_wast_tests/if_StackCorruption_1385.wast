;; 6. Create an `if` block with `loop` instructions nested inside `then` and `else` sections. Trigger the loop in both blocks and analyze whether the operand stack maintains its intended structure and content after multiple iterations.

(assert_invalid
  (module (func $loop-in-if
    (if (result i32) (i32.const 1)
      (then (block (loop (br 1)) (i32.const 1)))
      (else (block (loop (br 1)) (i32.const 1)))
    )
  ))
  "type mismatch"
)