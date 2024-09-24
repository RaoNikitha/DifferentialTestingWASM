;; 6. **Test Description**: A complex flow with a `br_table` that includes backward and forward branches, ensuring one of the branches leads to an operand stack that doesn’t match the block’s required type, causing an `unreachable` instruction. This examines backward and forward branching type checks.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (loop
          (block (result i32)
            (br_table 1 0 (i32.const 0) (local.get 0))
            (i32.const 1)
          )
        )
      )
    )
  )
  "type mismatch"
)