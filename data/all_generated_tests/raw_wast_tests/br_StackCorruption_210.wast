;; 1. Test a simple `br` instruction inside a single `block`, checking if the operand stack unwinds correctly to the depth of the `block`. Expect stack corruption if improper management results in incorrect data left on the stack or insufficient cleaning of the stack.

(assert_invalid
  (module
    (func $test
      (block
        (i32.const 1)
        (i32.const 2)
        (br 0)
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)