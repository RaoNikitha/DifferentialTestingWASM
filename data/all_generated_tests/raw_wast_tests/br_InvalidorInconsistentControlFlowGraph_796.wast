;; Introduce a mix of `block`, `loop`, and `if` structures with a `br` instruction in the innermost block targeting an outer `loop`. Validate if the `br` instruction correctly breaks out and the loop continues. Testing for: Confirming the CFG and operand stack handling when breaking out from mixed structured control constructs to an outer loop.

(assert_invalid
  (module
    (func $differential-test
      (block
        (loop
          (if (i32.const 1)
            (block
              (br 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)