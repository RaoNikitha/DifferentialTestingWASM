;; 8. Test Description: Define a block with a `call` to a function that modifies global variables and expects a specific stack state upon modification. WebAssembly should verify state consistency through `check_block`, whereas `wizard_engine` might not account for side effects, leading to inconsistent results.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global
      (global.set $g (i32.const 1))
    )
    (func $test_block
      (block (result i32)
        (call $modify_global)
        (global.get $g)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)