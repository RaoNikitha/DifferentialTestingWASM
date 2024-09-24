;; 6. Use a `br_table` inside a loop structure that contains multiple nested `if` branches, with the operand forcing a jump to a label that the outer loop would target upon its exit condition, testing the correct interpretation of loop exits.

(assert_invalid
  (module (func $loop_with_nested_if
    (block $exit
      (loop $top
        (if (i32.const 1)
          (then
            (block
              (block
                (br_table 0 1 $exit (i32.const 2))
              )
            )
          )
        )
      )
    )
  ))
  "unknown label"
)