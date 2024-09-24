;; 1. **Test with Multiple Nested Blocks:** Create a function with several nested blocks, inserting an `unreachable` within the innermost block. Use `br` instructions to exit each block. Validate if all environments trap immediately upon hitting `unreachable`, ensuring no invalid branch resolution to incorrect blocks.

(assert_invalid
  (module (func $nested-blocks-unreachable
    (block
      (block
        (block
          (unreachable)
        )
        (br 1)
      )
      (br 0)
    )
  ))
  "unreachable instruction trap"
)