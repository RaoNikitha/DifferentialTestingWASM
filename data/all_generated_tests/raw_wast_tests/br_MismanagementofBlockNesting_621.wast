;; 2. **Test 2**: Construct a WASM function with multiple nested loops, and use a `br` instruction to jump out of the inner loop to an outer one. Ensure that the target label exists and observe the stack state to check if it correctly unwinds and matches type expectations. This tests if the operand stack management in nested loops is appropriately handled.

(assert_invalid
  (module
    (func $nested-loop-branch-invalid (result i32)
      (block (result i32)
        (loop (result i32)
          (loop (result i32)
            (br 2 (i32.const 42)) 
          )
        )
      )
    )
  )
  "type mismatch"
)