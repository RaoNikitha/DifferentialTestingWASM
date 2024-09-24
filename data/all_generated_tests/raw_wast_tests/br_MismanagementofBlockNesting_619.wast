;; 10. **Test Misaligned Nesting and Branching:**     Construct scenarios where `br` instructions aim to branch out of blocks at a non-matching depth, testing the implementation's error handling for invalid or misaligned nested structures. This includes cases where the `br` targets labels that do not exist at the specified level.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 3) ; This br instruction incorrectly targets a label level that does not exist
        )
      )
    )
  )
  "unknown label"
)