;; A `block` incorporating a `loop` within it, where the loop pushes and pops values on the stack, ensuring the final stack state matches the block type result.

(assert_invalid
  (module (func $block-with-loop (result i32)
    (block (result i32)
      (loop (result i32)
        (i32.const 1)
        (br 1)
      )
    )
  ))
  "type mismatch"
)