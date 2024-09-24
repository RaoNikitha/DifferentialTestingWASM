;; 10. Construct a loop featuring `unreachable` at transitions between multiple nested loops combined with a varied pattern of control flow breaks. The test inspects how each implementation reacts to type polymorphism and if unhandled states lead to infinite loops.

(assert_invalid
  (module
    (func $test-unreachable-nested-loops
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            (unreachable)
            (br 2)
          )
          (unreachable)
        )
        (i32.const 0)
      )
      (drop)
    )
  )
  "type mismatch"
)