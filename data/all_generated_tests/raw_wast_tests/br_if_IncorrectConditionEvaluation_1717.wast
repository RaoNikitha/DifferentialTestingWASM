;; 8. **Test Description**: Use a `br_if` inside an `if` statement within a loop. Set the `br_if` condition to false and verify that the loop continues execution as expected.

(assert_invalid
  (module
    (func $loop_with_if_and_br_if
      (loop
        (if (i32.const 0)
          (then (br_if 0 (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)