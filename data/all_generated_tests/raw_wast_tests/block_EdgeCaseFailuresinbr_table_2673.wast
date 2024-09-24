;; 4. **Test Description**: Create a `block` containing nested `blocks` with interdependent `br_table` instructions, and manipulate the index to force a jump beyond the deepest nested block.    - **Constraint**: Validate that the implementation properly unwinds through multiple levels of blocks and handles out-of-bound indices correctly.    - **Edge Case**: This checks deep nesting with incorrect indices aimed at ensuring robust stack unwinding and correct index resolution.

(assert_invalid
  (module (func $test-deep-nested-br_table
    (block $outer (result i32)
      (i32.const 0)
      (block $inner1 (block $inner2 (block $inner3
        (br_table 3 1 2 0 (i32.const 3))
      )))
    )
  ))
  "branch depth out of bounds"
)