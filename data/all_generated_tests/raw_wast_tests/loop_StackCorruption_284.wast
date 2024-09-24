;; 5. Test a deeply nested `loop` structure with large local variable allocations, verifying if backward jumps via `br` preserve and restore local states and manage the operand stack height efficiently.

(assert_invalid
  (module
    (func $deep-nested-loop
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      (loop (result i32)
        (local.set 0 (i32.const 10))
        (br_if 0 (local.get 1))
      )
    )
  )
  "type mismatch"
)