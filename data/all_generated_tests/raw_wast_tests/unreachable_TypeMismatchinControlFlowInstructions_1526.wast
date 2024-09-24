;; 7. Use a `br_if` instruction with a condition and `unreachable` in the block it could potentially branch to, making sure subsequent code incorrectly assumes `i32` values on the stack.

(assert_invalid
  (module
    (func
      (block
        (br_if 0 (i32.const 1))
        (unreachable)
        (i32.const 0)
        (i32.const 1)
      )
    )
    (func $foo (param i32) (result i32)
      (local.get 0)
      (block
        (br_if 0 (i32.const 0))
        (unreachable)
        (i32.add)
      )
    )
  )
  "type mismatch"
)