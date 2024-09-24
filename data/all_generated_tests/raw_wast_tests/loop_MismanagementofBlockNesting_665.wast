;; - Test 6: Include a loop nested inside an if-block within another loop, and introduce break conditions with `br_if` targeting the outer loop. This examines if the implementation can correctly manage breaking from multiple nested layers and jump directly to the outermost loop.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (if (result i32)
          (i32.const 1)
          (loop (result i32)
            (i32.const 0)
            (br_if 1)
            (i32.const 2)
          )
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)