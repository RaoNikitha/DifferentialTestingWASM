;; 9. Write a `br_table` where all indices result in branches to blocks containing `unreachable` instructions. This examines the behavior when all possible branches necessarily lead to an unconditional trap.

(assert_invalid
  (module
    (func $test-br_table-unreachable
      (block 
        (block (br_table 0 0 (i32.const 0) (unreachable)))
      )
    )
  )
  "type mismatch"
)