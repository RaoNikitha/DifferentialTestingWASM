;; A `loop` that contains a `br` instruction targeting itself with an `i32.const` value on the stack. Test for the correct backward jump implementation and the consistent handling of the operand stack that avoids infinite execution.

(assert_invalid
  (module
    (func $test-loop-br
      (loop $L
        (i32.const 0)
        (br 0)
      )
    )
  )
  "unreachable code"
)