;; 3. Formulate a block that contains a `br_table` with case indices that exceed the proper nesting depth, causing unexpected control flow to execute the unreachable instruction.

(assert_invalid
  (module (func $test-br-table-depth (result i32)
    (block (result i32)
      (block (result i32)
        (br_table 2 0 (i32.const 0)) (unreachable)
      ) (i32.const 1)
    )
  ))
  "invalid branch depth"
)