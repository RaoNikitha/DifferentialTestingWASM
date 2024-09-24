;; Test 7: A `loop` with a `blocktype` indicating an integer result type, nested in another `block` that expects the `loop` to return a floating-point type, leading to a type mismatch.

(assert_invalid
  (module
    (func $type-mismatch (result f32)
      (block (result f32)
        (loop (result i32)
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)