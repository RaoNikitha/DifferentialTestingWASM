;; 5. Create a loop containing a sequence of instructions with multiple `loop` blocks nested within each other. Use `br` instructions to target specific outer loops to test if the branches correctly resolve their intended loop in the presence of multiple nested labels.

(assert_invalid
  (module
    (func $nested-loops
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (i32.const 2)
          (br 1)
        )
        (br 1)
      )
    )
  )
  "type mismatch"
)