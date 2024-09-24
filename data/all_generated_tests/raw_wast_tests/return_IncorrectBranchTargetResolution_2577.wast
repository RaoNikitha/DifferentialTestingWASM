;; Function with an early `return` inside the first block of a deeply nested structure (`block` within `block` within `block`), ensuring it does not mistakenly target any intermediate or nested block.

(assert_invalid
  (module
    (func $deep-nested-early-return (result i32)
      (block (block (block
        (return (i32.const 42))
        (i32.const 0)
      )))
    )
  )
  "type mismatch"
)