;; Construct a test where an `if-else` ladder evaluates multiple `i32` comparison conditions. The `unreachable` instruction should be placed in an `else` branch that must only execute if all conditions fail. Test for traps due to erroneous condition evaluations.

(assert_invalid
  (module
    (func $multiple-conditions (param i32 i32 i32 i32)
      (if (result i32) 
        (i32.eq (local.get 0) (local.get 1))
        (i32.const 1)
        (if (result i32)
          (i32.eq (local.get 2) (local.get 3))
          (i32.const 2)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)