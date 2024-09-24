;; 3. **Conditional Blocks with Outward Branching:**    Use multiple nested `if` constructs, each containing nested blocks, and use `br` instructions to break out to various outer blocks. Check if the branch results are consistent and correctly computed when dealt with conditional structures and nested blocks.

(assert_invalid
  (module
    (func $conditional-blocks-outward-branching (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 0)
          (block (result i32)
            (if (result i32)
              (i32.const 1)
              (block (result i32)
                (br 2) ;; outward branch to the outermost block, skipping intermediate blocks
                (i32.const 2)
              )
              (i32.const 3)
            )
            (i32.const 4)
          )
          (i32.const 5)
        )
      )
    )
  )
  "type mismatch"
)