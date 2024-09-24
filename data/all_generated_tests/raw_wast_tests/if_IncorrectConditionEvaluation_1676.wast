;; - **Test Description 7**: An `if` condition that uses a comparison between local variables initialized with unequal values (e.g., `local.get 0`, `local.get 1`, `i32.eq` where `local.get 0` is initialized to 1 and `local.get 1` is initialized to 0). Verify the correct branch is taken when the condition evaluates to false.

(assert_invalid
  (module
    (func (local i32 i32)
      local.get 0
      local.get 1
      i32.eq
      if (then (i32.const 1)) (else (i32.const 2))
    )
  )
  "type mismatch"
)