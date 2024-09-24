;; Test a `loop` block nested within another `loop`, with a `br_table` in the inner loop having an invalid index that should cause branching to a specific outer `loop` target, ensuring correct label indexing in both implementations.

(assert_invalid
 (module
  (func (result i32)
   (loop (result i32)
    (i32.const 1)
    (loop (result i32)
     (i32.const 0)
     (br_table 0 1)
    )
   )
  )
 )
 "type mismatch"
)