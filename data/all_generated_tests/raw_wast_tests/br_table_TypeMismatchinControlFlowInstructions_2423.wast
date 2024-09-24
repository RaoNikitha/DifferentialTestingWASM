;; 3. Test Description 3: Create a scenario where a block contains a `br_table` that branches to multiple label indices, ensuring one of the branches has an operand type mismatch.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 2 (local.get 0) (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)