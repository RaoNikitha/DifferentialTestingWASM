;; 7. **Test Description**: Create a block that involves stacking and unstacking of multiple labels via `br` and `br_if` in different nesting depths with varying types. This tests if the consistent stack state is maintained concerning block type expectations and label manipulations.

(assert_invalid
  (module 
    (func $test-differential-blocks
      (block (result i32)
        (block (result f32)
          (br 1 (i32.const 42))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)