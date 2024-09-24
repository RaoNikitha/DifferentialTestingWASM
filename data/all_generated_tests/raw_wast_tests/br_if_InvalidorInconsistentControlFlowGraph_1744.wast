;; 5. **Test Description: Nested Blocks with Incorrect Label Lookup**    - Implement nested `block` and `if` structures where `br_if` targets a deeply nested label, miscalculating the relative index.    - **Constraint Check**: Ensure relative label lookups navigated correctly.    - **CFG Relevance**: Verifies accurate relative label referencing within complex nesting in CFG.

(assert_invalid
  (module 
    (func (result i32)
      (block (result i32)
        (block
          (if (i32.const 1)
            (br_if 1 (br_if 2 (i32.const 1)))
          )
        )
      )
    )
  )
  "invalid label"
)