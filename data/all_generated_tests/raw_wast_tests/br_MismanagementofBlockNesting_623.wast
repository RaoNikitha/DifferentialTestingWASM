;; 4. **Test 4**: Create a block inside an `if-else` structure with a `br` instruction attempting to exit to both cases of the `if-else`. This tests if the correct flow of control is maintained when branching across branching structures.

(assert_invalid
  (module
    (func $br_from_if_else_block
      (if (result i32)
        (then
          (block (br 1)) (i32.const 1)
        )
        (else
          (block (br 1)) (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)