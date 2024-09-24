;; 5. Create a sequence where a `loop` is nested in a `block`, followed by another `loop`. Use `br` instructions to jump back to the beginning of the innermost loop and to the start of the outer loop, ensuring operand stack management handles the nested loop boundaries appropriately.

(assert_invalid
  (module (func
    (block (loop (result i32)
      (i32.const 1)
      (br 1)
    ))
    (loop (result i32)
      (i32.const 2)
      (br 1)
    )
  ))
  "type mismatch"
)