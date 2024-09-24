;; 1. **Function call within a deeply nested block with mismatched function type**:    - **Description**: Define a function with mismatched signature and call it indirectly within a deeply nested block structure. Check if the nesting level affects the dynamic type checking and whether the trap is correctly triggered.    - **Expected outcome**: Ensure both implementations trigger a trap due to the function type mismatch within the nested block.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (table funcref (elem $func1))
    (func $func1 (param i32) (result i32)
      (i32.const 42)
    )
    (func $deeply_nested_block
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (i32.const 0)
                          (i32.const 0)
                          (call_indirect (type $sig2) (i32.const 0))
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)