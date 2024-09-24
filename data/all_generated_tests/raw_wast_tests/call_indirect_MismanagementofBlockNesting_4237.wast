;; 6. **Test 6**: Deeply nested block with varying block indices:    - Create deeply nested blocks with increasing block indices.    - Test `call_indirect` inside those blocks ensuring it does not overlook the index structure in block nesting.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (func $nested-block 
      (block 
        (block 
          (block
            (block
              (block
                (block
                  (block
                    (call_indirect (type 0) (i32.const 1) (i32.const 0))
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