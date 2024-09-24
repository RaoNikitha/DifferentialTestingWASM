;; 4. **Test Description**: Create overlapping blocks with different `blocktype` annotations and use `br` to exit from the innermost block to the outermost block. Ensure that both implementations correctly identify and implement the exit sequence.

(assert_invalid
  (module
    (func $nested-block-different-types
      (block (result i32)
        (block (result f32)
          (br 1 (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)