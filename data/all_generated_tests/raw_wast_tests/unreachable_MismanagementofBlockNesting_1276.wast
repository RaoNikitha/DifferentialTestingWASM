;; 7. **Test Description:**    Create a test where multiple loops are nested with an `unreachable` instruction located in the innermost loop, and a `br_if` targets outer loops and blocks.    *Constraint Checked:* Loop-nesting depth and correct trap invocation.    *Mismanagement Focus:* Failure to trap at correct loop level upon execution of `unreachable` affecting `br_if` targets.

(assert_invalid
  (module
    (func $test_nested_loops_with_unreachable (result i32)
      (block (result i32)
        (loop (result i32)
          (loop (result i32)
            (unreachable)
            (br_if 1 (i32.const 1))
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
 "type mismatch"
)