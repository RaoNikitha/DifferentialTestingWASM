;; 7. **Test Description**: Use consecutive `block` instructions with varying depths and introduce a `br_if` in the third block, aiming at the first block (`label 2`). Inspect if the resolution skips intermediate blocks wrongly and jumps to an unrelated structure.

(assert_invalid
  (module
    (func $test-depth-blocks
      (block
        (block
          (block
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "invalid label"
)