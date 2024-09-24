;; Test 4: A `loop` that starts with an `i64` push onto the stack, followed by a `br` instruction that assumes the operand stack contains an `i32`. This will assess the detection of operand stack type mismatches when branching inside loops.

(assert_invalid
  (module
    (func $type-mismatch-in-loop
      (loop
        (i64.const 42)
        (br 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)