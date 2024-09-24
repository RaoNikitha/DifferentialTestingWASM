;; Test a `loop` block with a `br_table` where the table index exceeds the number of available targets by one, ensuring the default branch is taken and no undefined behavior occurs.

(assert_invalid
  (module (func
    (loop (result i32)
      (block (br_table 1 (i32.const 0)) (i32.const 1))
      (i32.add)
    ) 
  ))
  "index out of range"
)