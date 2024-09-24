;; 2. **Test 2: Incorrect Type in Loop Body after `nop`**    - Use a `nop` instruction followed by a loop with mismatched types in its body. Validate if the loop correctly identifies the type mismatch regardless of `nop`.    - **Constraint**: Tests `nop`'s placement does not interfere with loop type validation.    - **Type Mismatch Check**: Ensures loop body maintains correct result value types.

(assert_invalid
  (module
    (func $test
      (nop)
      (loop $loop (result i32)
        (block
          (nop)
          (br $loop)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)