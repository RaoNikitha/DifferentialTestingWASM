;; - Test 8: Formulate a function that calls another function with deep nesting of block structures, issuing `br` instructions that should resolve to blocks several levels up. Assess if the branch instructions correctly target the intended blocks.

(assert_invalid
  (module
    (func $inner (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 2 (i32.const 42))
          )
        )
      )
    )
    (func $outer
      (call $inner)
      (call $inner)
    )
  )
  "type mismatch"
)