;; 4. Provide a `block` with multiple nested `loop` and sequential `br` instructions; wizard_engine's improper validation should result in one `br` failing to break correctly, causing an infinite loop.

(assert_invalid
  (module
    (func $block-with-loop-and-br
      (block (result i32)
        (loop
          (br 0)
          (br 1)
          (br 2)
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)