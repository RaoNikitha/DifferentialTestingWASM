;; 5. **Test Input: Multiple `loop` Blocks with Shared Instructions**    - Description: Test two adjacent `loop` blocks sharing some instructions and ensure `br` branches within respective loops.    - Constraint: Check correct handling of multiple loops with shared instruction sequences.    - Focus: Determine if identical sequences in different loops maintain accurate branch targets.

(assert_invalid
  (module
    (func $multi-loop-with-shared-instr (result i32)
      (i32.const 42)
      (loop (result i32)
        (i32.const 1)
        (br 1)
      )
      (loop (result i32)
        (i32.const 2)
        (br 1)
      )
    )
  )
  "type mismatch"
)