;; 5. Insert an `unreachable` within a loop inside a block and then execute a `br` to the block. Tests whether the control flow exits the loop and enters the outer block correctly without misinterpreting the nest levels after the `unreachable`.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (loop (result i32)
        (unreachable)
      )
      (br 1)
    )
    (i32.const 0)
  ))
  "type mismatch"
)