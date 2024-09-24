;; 3. **Nested Blocks with Relative Indexing:**    - Create nested blocks and a `br_table` where label indices must be correctly resolved relative to the current block's nesting depth.    - *Testing for*: Correct label index resolution with nested blocks.    - *Constraint*: Label indexing and structured control flow.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (br_table 2 1 0 (local.get 0))
          )
        )
      )
    )
  )
  "unknown label"
)