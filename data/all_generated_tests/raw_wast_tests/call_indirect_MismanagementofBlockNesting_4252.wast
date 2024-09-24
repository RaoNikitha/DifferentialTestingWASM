;; 1. **Test Description**: A `call_indirect` instruction placed inside a deeply nested loop structure with conditional branches to test the operand stack being correctly managed across nested contexts. This checks if looping and conditional nesting do not cause stack overflow or underflow errors when calling functions indirectly.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      (local.get 0)
    )
    (func $test
      (i32.const 0)
      (loop $outer
        (i32.const 1)
        (br_if $outer (local.get 0))
        (loop $inner
          (i32.const 2)
          (br_if $inner (local.get 0))
          (if (i32.const 1)
            (then
              (call_indirect (type $sig) (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)