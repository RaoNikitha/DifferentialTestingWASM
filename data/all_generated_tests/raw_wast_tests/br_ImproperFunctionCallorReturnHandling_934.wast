;; <Test 5> Construct a WebAssembly module with multiple nested `block` and `if` structures. Inside an `if` statement, place a `call` instruction. Following the `call`, use a `br` instruction that branches out to a label before the `if`. Confirm the function call's side-effects are correctly applied after branching.

(assert_invalid
  (module
    (func $test_br_instruction
      (block $outer
        (block $inner
          (i32.const 0)
          (if (i32.const 1)
            (then
              (call $dummy_function)
              (br $outer)
            )
          )
        )
      )
    )
    (func $dummy_function)
  )
  "branch target type mismatch"
)