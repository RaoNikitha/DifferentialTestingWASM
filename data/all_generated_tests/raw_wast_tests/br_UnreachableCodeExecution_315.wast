;; 6. Construct a sequence with nested `block` and `if` structures. Add a `br` with wrong operand stack size, causing operand stack mismanagement and an unintended jump to an `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (then
            (i32.const 1)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)