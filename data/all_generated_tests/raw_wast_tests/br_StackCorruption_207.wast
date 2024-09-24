;; 8. Test Description: Implement a function featuring a deep nesting of `block`, `loop`, and `if` constructs with arbitrary value pushes preceding a `br` instruction. Validate that stack unwinding and operand consistency are preserved and detect underflows or overflows in `wizard_engine`.

(assert_invalid
  (module
    (func $deep-nesting
      (block
        (block
          (block
            (loop
              (if (i32.const 1)
                (then
                  (i32.const 42)
                  (br 3)
                )
              )
            )
          )
        )
      )
    )
    (export "deep_nesting" (func $deep-nesting))
  )
  "stack type mismatch"
)