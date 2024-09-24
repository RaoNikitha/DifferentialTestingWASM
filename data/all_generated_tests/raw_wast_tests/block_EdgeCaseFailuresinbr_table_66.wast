;; 7. **Test with Deeply Nested Blocks with `br_table` Overflowing Index**:    - Several nested `blocks` with a `br_table` in the innermost block having an index exceeding all outer blocks' labels.    - Tests the handling of deep label stacks and proper constraint fulfillment for label indices.    - Edge Case: Depth handling and stack management in wizard_engine might misinterpret or mishandle deep nesting and overflowing indices.

(assert_invalid
  (module (func $deep-nested-blocks-overflow (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32) (br_table 6 (i32.const 1)))
            )
          )
        )
      )
    )
  ))
  "label index out of bounds"
)