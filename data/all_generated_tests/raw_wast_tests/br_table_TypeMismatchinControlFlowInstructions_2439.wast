;; Create a `br_table` test where the operand from the stack used to index the label is of type `f32` instead of `i32`. This should be a type mismatch scenario that reinforces operands’ correct type for indexing.

(assert_invalid
  (module
    (func (param f32) (result i32)
      (block (result i32)
        (br_table 0 1 (local.get 0))
      )
    )
  )
  "type mismatch"
)