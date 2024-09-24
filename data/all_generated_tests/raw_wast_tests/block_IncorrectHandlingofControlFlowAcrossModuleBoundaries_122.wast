;; 3. Export a function that includes a `block` which branches to an outer label. Call this exported function from another module to check if branch indices are properly managed across module boundaries.

(assert_invalid
  (module
    (func $block-branch-across-modules
      (block (result i32)
        (block (result i32) (br 1 (i32.const 42))) (return)
      )
      (i32.const 0)
    )
    (export "testFunc" (func $block-branch-across-modules))
  )
  "type mismatch"
)