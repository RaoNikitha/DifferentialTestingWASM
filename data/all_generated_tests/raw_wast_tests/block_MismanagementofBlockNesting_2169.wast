;; 10. **Test 10**:    Implement numerous nested blocks, each incrementally increasing nesting depth. In the deepest block, use `br` to target the outermost block, validating that the nested depth count and labels resolve correctly. This tests if the max nesting depth and asynchronous control flows are managed accurately by the implementations.

(assert_invalid
  (module (func $deeply_nested_block
    (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (block (result i32)
                    (block (result i32)
                      (block (result i32)
                        (br 9 (i32.const 42))
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
  ))
  "type mismatch"
)