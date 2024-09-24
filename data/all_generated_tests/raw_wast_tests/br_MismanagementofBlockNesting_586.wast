;; 7. Craft a test with sequential but distinct nested blocks and issue a `br` to the first block from the deepest nested block. This checks for the correct outward branching and stack unwinding ratios.

(assert_invalid
  (module
    (func $nested-br-test
      (block (result i32)  ;; Block 0
        (block              ;; Block 1
          (block            ;; Block 2
            (i32.const 42)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)