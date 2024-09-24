;; 5. Craft a test where the `if` condition is true, and the subsequent instructions lead into a loop. Improper alignment in types propagates due to state discrepancies in `else` branch result handling causes the loop to never exit.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (loop (result i32)
            (br_if 0 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)