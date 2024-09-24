;; Test 8: Design a scenario where `br_if` is used inside a function with local variables and additional operand pushes between branches. Verify that local variables and stack states are preserved correctly after conditional branches.

(assert_invalid
  (module
    (func $br_if_locals (result i32)
      (local i32) 
      (local.set 0 (i32.const 42))
      (block (result i32)
        (br_if 0 (i32.const 0))
        (local.get 0)
        (i32.const 1)
        (i32.add)
      )
    )
  )
  "type mismatch"
)