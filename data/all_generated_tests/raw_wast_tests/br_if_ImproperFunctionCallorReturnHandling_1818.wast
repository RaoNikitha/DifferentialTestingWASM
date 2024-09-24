;; 9. **Test Description:** Structure a nested `block` and `loop` with a `br_if` that jumps to an outer block right before a `call` instruction, ensuring the correct control flow and operand stack state before the function call is made.    - **Constraint:** Tests correct block-to-block jumps within nested structures.    - **Improper Handling:** Confused control flow may lead to incorrect function calls.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (loop
            (br_if 1 (i32.const 1))
          )
        )
        (call $some_function)
      )
    )
    (func $some_function (nop))
  )
  "unknown label"
)