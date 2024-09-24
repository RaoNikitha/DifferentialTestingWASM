;; 10. Use nested `block` structures with mixed depth `br` instructions that target a combination of inner and outer blocks (e.g., `block (br 0) block (br 1)`). This evaluates whether the implementation can correctly unwind the stack and control flow by maintaining accurate block target resolutions.

(assert_invalid
  (module
    (func $nested-blocks-with-br
      (block
        (i32.const 1)
        (block
          (i32.const 2)
          (br 1)
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)