;; 8. **Test Description:** Configure a loop with a `br` instruction placed after a stack-using operation (e.g., addition/subtraction) and targeting an enclosing `block`. The test validates if proper operand stack unwinding occurs before branching to avoid running into infinite loop conditions.

(assert_invalid
  (module
    (func $br-unwind-stack
      (block $B
        (loop $L
          (i32.const 10)
          (i32.const 20)
          (i32.add)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)