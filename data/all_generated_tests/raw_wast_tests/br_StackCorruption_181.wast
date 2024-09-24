;; 2. Create a test where multiple branches occur within a single control block, and one of them targets an outer block, verifying that operands are correctly preserved and the stack remains intact through multiple unwinds.

(assert_invalid
  (module
    (func $multiple-branches-with-preserved-operands
      (block $outer
        (block $inner
          (br $outer (i32.const 2))
          (drop)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)