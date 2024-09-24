;; 4. **Loop with Return in Condition**:    Construct a loop with a `return` placed conditionally inside the loop body.    - Ensures CFG correctly maps the exit points of loops due to returns.

(assert_invalid
  (module
    (func $loop_with_return (result i32)
      (local i32)
      (block (result i32)
        (loop (result i32)
          (br_if 1 (i32.eqz (local.get 0)))
          (return (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)