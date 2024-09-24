;; Test Description 10: Set up a loop within a block where nested loops include repeated conditional `br_table` branches targeting various depths. Incorrect indexing modifies operand stack predictions, resulting in non-terminating loops.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 0 1 2 (i32.const 0))
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)