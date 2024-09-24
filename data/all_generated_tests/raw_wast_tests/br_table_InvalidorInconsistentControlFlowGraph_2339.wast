;; 9. Insert a `br_table` in a function with multiple `block` constructs, making certain labels point to both well-structured and invalid nested blocks. Manipulate operand stack types and counts to force an inconsistency between targeted and actual blocks, hence checking CFG integrity.

(assert_invalid
  (module (func $test
    (block (result i32)
      (block (result i64)
        (block (result i32)
          (br_table 0 2 (i32.const 1) (i32.const 0) (i64.const 1))
        )
      )
    )
  ))
  "type mismatch"
)