;; 3. **Test Backwards Branch in `br_table` Targeting Loop**:    - **Description**: A `br_table` instruction targeting a previous loop's block, simulating a complex backwards branch.    - **Reasoning**: Validates the handling of stack unwinding and indexing in complex backward branches.    - **Edge Relation**: Ensures consistent backward branching to loops, mirroring the behavior of `br_if`.

(assert_invalid
  (module
    (func $test-loop-br_table
      (loop $outer (result i32)
        (block $inner
          (br_table $inner $outer (i32.const 0))
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)