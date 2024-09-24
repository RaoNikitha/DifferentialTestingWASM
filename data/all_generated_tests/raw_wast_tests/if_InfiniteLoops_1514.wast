;; 5. **Loop with `else` Skipping the Loop**: Test an `if ... else` inside a `loop` where the `else` block has a `br_if` that should terminate the loop. Validate that the `br_if` condition is evaluated correctly to prevent an infinite loop.

(assert_invalid
  (module
    (func $loop-else-br_if (param i32) (result i32)
      (loop (result i32)
        (if (result i32) (local.get 0)
          (then (local.get 0))
          (else (br_if 1 (local.get 0)) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)