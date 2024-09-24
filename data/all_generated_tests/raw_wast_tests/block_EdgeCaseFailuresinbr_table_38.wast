;; 9. Test Description: Implement a `block` with a `br_table` where the operand stack is manipulated in complex ways before branching. This tests both implementations' handling of stack operations in correlation with `br_table` and potential stack height mismatches.

(assert_invalid
  (module
    (func $complex-br_table (param i32) (result i32)
      (block (result i32)
        (block (br_table 0 1 (get_local 0)))
      )
    )
  )
  "type mismatch"
)