;; 7. **Test Description**: Use a `br_table` where all possible indices refer to the same valid function, but the function alters its execution state unexpectedly (e.g., modifying a global). This checks if multiple calls to the same function maintain a consistent state.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $alter_global
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
    )
    (func $test_br_table
      (block
        (br_table 0 0 0 (call $alter_global))
      )
    )
    (table funcref (elem $alter_global))
  )
  "type mismatch"
)