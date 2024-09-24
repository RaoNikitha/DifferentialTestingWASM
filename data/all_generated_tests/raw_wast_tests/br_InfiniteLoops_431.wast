;; 2. **Test Description:** Implement a deep nesting of `block` and `loop` instructions. Use `br` instructions to target various levels of nested blocks. This test will validate correct label indexing and stack management to avoid falling into an infinite loop due to incorrect target labeling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (block (result i32)
                    (block (result i32)
                      (block (result i32)
                        (br 7)
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