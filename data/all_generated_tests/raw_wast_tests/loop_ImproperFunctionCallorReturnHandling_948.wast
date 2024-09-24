;; 9. **Test Description 9**:    Implement an idle loop with function calls that modify global variables and utilize branch instructions. Verify through return checks that loop exits correctly reflect all function-induced changes.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (result i32)
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (global.get $g)
    )
    (func $idle_loop
      (loop (result i32)
        (call $modify_global)
        (br_if 0 (i32.ne (global.get $g) (i32.const 5)))
      )
      (return (global.get $g))
    )
  )
  "type mismatch"
)