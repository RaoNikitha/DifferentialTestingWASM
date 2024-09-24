;; 10. **Test for Incorrect Br Logic in Loop with Call_Indirect**:     Embed `call_indirect` in a loop with a `br_if` instruction expected to exit the loop, but due to type mismatch or incorrect implementation, the `br_if` condition fails, leading to an infinite loop.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test
      (local $idx i32)
      (block $exit
        (loop $loop
          (local.set $idx (i32.const 0))
          (call_indirect (type $sig) (local.get $idx))
          (br_if $exit (i32.eqz (local.get $idx)))
          (br $loop)
        )
      )
    )
  )
  "type mismatch"
)