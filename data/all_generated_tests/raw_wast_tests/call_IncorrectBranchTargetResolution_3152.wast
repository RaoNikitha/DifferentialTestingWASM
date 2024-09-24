;; Test 1: Create a module with nested function calls where the inner function contains a branch instruction that refers to an outer block label. Ensure the branch incorrectly targets this outer block due to an off-by-one error in label resolution.

(assert_invalid
  (module
    (func $outer
      (block $L1
        (block $L2
          (call $inner)
        )
      )
    )
    (func $inner
      (br $L1)
    )
  )
  "unknown label"
)