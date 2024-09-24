;; Create an edge case with a control flow involving an `if` block immediately followed by a `loop`, then use `br` to incorrectly target the `if` block from within the loop, focusing on operand stack unwinding and label indexing.

(assert_invalid
  (module (func $invalid-branch-target
    (block
      (if (i32.const 1)
        (then
          (loop
            (br 1)
          )
        )
      )
    )
  ))
  "unknown label"
)