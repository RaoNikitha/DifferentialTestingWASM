;; 6. Create a nested block structure where the `br` targets a block whose label index matches another loop at the same nesting level. Verify that the resolution mechanism precisely targets the block instead of the similarly indexed loop.

(assert_invalid
  (module
    (func $nested-block-structure
      (block
        (loop
          (block (br 1))
          (i32.const 1)
        )
      )
    )
  )
  "unknown label"
)