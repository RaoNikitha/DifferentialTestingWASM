;; 9. **Test Description:** Create an exported function in a module with `br_if` and interaction with global variables, being called from a different module multiple times.    **Constraint Checked:** Persistent and correct handling of global state and stack within multi-call scenarios.    **Relation:** Ensures `br_if`'s proper control flow and global state integration between repeated cross-module calls.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test (result i32)
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (block (result i32)
        (br_if 0 (global.get $g) (i32.const 1))
        (i32.const 42)
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)