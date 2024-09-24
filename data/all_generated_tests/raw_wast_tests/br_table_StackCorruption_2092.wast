;; 2. Test a scenario where `br_table` branches forward and backward within nested blocks, ensuring consistent operand type lengths and types for each label. Check for proper stack unwinding.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (block
          (loop
            (br_table 0 1 2 (i32.const 0)) ;; forward and backward branch
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)