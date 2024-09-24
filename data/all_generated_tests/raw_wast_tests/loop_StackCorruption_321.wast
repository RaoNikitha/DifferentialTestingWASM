;; 2. Validate a loop with nested loops, each containing a `br_if` conditional branch. The test should ensure the correct handling of the operand stack when conditions are met and branches are taken, verifying the stack’s state consistency throughout the nested loop execution.

(assert_invalid
  (module (func $nested_loops (param i32) (result i32)
    (local i32)
    (loop (result i32)
      (i32.const 1)
      (local.set 0)
      (loop (result i32)
        (local.get 0)
        (i32.const 0)
        (i32.eq)
        (br_if 1)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (local.get 0)
        (br_if 0)
      )
    )
  ))
  "type mismatch"
)