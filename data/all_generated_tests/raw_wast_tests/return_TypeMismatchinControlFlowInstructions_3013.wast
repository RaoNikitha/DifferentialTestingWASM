;; Test a `loop` that expects a result type of an integer sequence but improperly leaves a string on the stack before the `return` instruction. Ensure both engines raise a type mismatch error.

(assert_invalid
  (module
    (func $return-type-mismatch-loop (result i32)
      (block (loop (nop) (br 1)))
      (return "mismatch")
    )
  )
  "type mismatch"
)