;; Test a `loop` block with a `br_table` that includes indices with some being exact matches and others out of bounds, ensuring proper handling and branching as per WebAssembly's rules.

(assert_invalid
  (module (func $loop-br_table
    (loop (result i32)
      (block (result i32)
        (br_table 0 1 (i32.const 2) (i32.const 3) (i32.const 10))
      )
    )
  ))
  "type mismatch"
)