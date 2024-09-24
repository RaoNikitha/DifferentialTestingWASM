;; - Test a `br_table` with indices pointing to forward labels but include backward jump indices to loop constructs to validate correct operand stack unwinding.

(assert_invalid
  (module
    (func
      (block
        (loop $loop1 (block $block1 (br_table 1 0 0 (i32.const 1) (i32.const 0))))
      )
    )
  )
  "type mismatch"
)