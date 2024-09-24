;; 9. Test Description: Combine nested `if`, `block`, and `loop` constructs in a function, where a `br` instruction is misplaced to bypass function calls, testing the validator’s capability to handle stack type mismatches during improper call/return handling.

(assert_invalid
  (module
    (func $nested-blocks-with-misplaced-br
      (block
        (loop
          (block
            (if (i32.const 1)
              (then
                (br 2)
                (call $dummy)
              )
            )
          )
        )
      )
    )
    (func $dummy)
  )
  "type mismatch"
)