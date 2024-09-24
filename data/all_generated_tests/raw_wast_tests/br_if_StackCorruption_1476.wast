;; Test 7: Create a test case where `br_if` is used within a large loop that also includes other branch instructions. Validate the stack after each iteration to ensure that the `br_if` instruction does not cause stack corruption.

(assert_invalid
  (module
    (func $test_large_loop_br_if_stack (result i32)
      (block
        (loop $outer
          (i32.const 1)
          (br_if 0 (i32.const 0))
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)