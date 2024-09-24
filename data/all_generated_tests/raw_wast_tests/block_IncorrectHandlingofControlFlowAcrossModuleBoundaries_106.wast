;; 7. **Conditional Branching Based on Imported Function Result**    - Inside a block, use `br_if` based on the boolean result from an imported function. Verify that stack unwinding appropriately handles the stack conditions.    - Highlights potential issues with branching conditions based on results from imported functions, ensuring uninterrupted execution flow.

(assert_invalid
  (module
    (import "javascript" "external" (func $external (result i32)))
    (func $test
      (block (result i32)
        (call $external)
        (br_if 0 (i32.eqz))
        (i32.const 1)
      )
      (unreachable)
    )
  )
  "type mismatch"
)