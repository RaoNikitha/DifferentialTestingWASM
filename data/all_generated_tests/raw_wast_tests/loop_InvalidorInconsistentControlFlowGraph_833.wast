;; 4. Create a loop with complex branching using `br_table` where the index operand points out-of-bounds, challenging the validity of indirect branch handling and CFG branching paths.

(assert_invalid
  (module (func $complex-branch-br_table
    (loop (result i32)
      (block (br_table 0 1 2 
        (i32.const 3)))
    )
  ))
  "out of bounds"
)