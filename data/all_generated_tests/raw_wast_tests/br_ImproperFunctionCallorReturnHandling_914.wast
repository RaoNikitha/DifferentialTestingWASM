;; 5. Test Description: Define a function with multiple `if` blocks and an inner function call. Inside an `if` block, place a `br` instruction that skips to a return statement without proper operand management to emulate improper returns.

(assert_invalid
  (module
    (func $test_br_inner_function_call
      (block
        (if (i32.const 1)
          (then
            (br 0)
            (call 0)
          )
        )
      )
      (return (i32.const 0))
    )
  )
  "type mismatch"
)