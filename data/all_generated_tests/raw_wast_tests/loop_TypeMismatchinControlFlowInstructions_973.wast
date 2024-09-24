;; 4. **Test 4: Inner Loop Type Conflict**    - Description: Nest a loop instruction inside another loop, ensuring the inner loop changes the stack's state in a way that mismatches the outer loop's block type expectations.    - Reasoning: This tests the proper handling of nested control flow constructs and the preservation of type constraints within nested loops.

(assert_invalid
  (module
    (func $nested-loop-type-conflict
      (loop (param i32)
        (loop (param f32) (drop))
      )
    )
  )
  "type mismatch"
)