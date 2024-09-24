;; 9. Implement a test where an `if` instruction leading to a loop involves a flaw in operand stack management due to extending context incorrectly. When the condition supposed to exit the loop is managed globally rather than contextually, leading to an infinite loop.

(assert_invalid
  (module (func $infinite-loop-due-to-context (result i32)
    (if (result i32) (i32.const 1)
      (then (loop (if (result i32)
        (i32.const 1)
        (then (br 1 (i32.const 0)))
        (else (br 2 (i32.const 1))))
      ))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)