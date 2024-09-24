;; 2. Construct a function with an outer block of type `[i32] -> []` and an inner block that uses `return` in a way that introduces a stack mismatch due to leftover stack values post-return in WebAssembly, and compare results with the Wizard Engine’s handling of unreachable code.

(assert_invalid
  (module
    (func $test-stack-mismatch-return
      (block (result i32)
        (i32.const 10)
        (block
          (i32.const 20)
          (return)
        )
        (i32.const 30)
      )
    )
  )
  "stack mismatch"
)