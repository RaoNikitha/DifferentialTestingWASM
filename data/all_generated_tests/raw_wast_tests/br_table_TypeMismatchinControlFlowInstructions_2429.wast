;; 9. Test Description 9: Construct a scenario with a `br_table` inside a block, where the default label index expects a completely different operand type sequence than what is actually present on the stack.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (block (result f32)
          (br_table 0 0 (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)