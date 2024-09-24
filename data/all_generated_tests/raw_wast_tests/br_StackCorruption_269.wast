;; 10. **Test Name: Loop Branch with Excessive Operands**     - Develop a loop that accepts fewer operand types than provided by a `br` instruction targeting it. This helps in verifying that no extra operands corrupt the stack after the branch.

(assert_invalid
  (module
    (func $loop-with-excessive-operands
      (loop (i32.const 0) (i32.const 1) (br 0))
    )
  )
  "type mismatch"
)