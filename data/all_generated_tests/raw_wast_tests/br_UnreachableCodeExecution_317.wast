;; 8. Design a test case with a deeply nested `if-else` chain. Branch out incorrectly to an outer block causing incorrect operand type handling leading the execution to an `unreachable` instruction.

(assert_invalid
  (module (func $deep-nested-if (result i32)
    (block (result i32)
      (if (result i32)
        (else
          (block (result i32)
            (if (result i32)
              (else
                (block (result i32)
                  (br 3 (i32.const 1))
                )
              )
            )
          )
        )
      )
      (unreachable)
    )
  ))
  "type mismatch"
)