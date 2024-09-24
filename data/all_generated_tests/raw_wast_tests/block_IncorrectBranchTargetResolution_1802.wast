;; 3. **Test Loop with `br` to Outer Block**:    - Construct a loop within a block and use `br` to target the outer block.    - This scenario verifies branching from within a loop to an outer block.    - Expected result: WebAssembly should handle this correctly, while errors or infinite loops might arise in wizard_engine.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)