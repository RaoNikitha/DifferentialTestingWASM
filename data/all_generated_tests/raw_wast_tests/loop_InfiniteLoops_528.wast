;; - Test 9: Generate a loop where improper label index handling in `Wizard Engine` for multiple nested loops results in infinitely looping in the first loop, contrasting `WebAssembly`’s correct label indexing.

(assert_invalid
  (module
    (func $nested-loops-label-index (result i32)
      (loop $outer (loop $inner (br $outer)))
    )
  )
  "type mismatch"
)