;; 9. Formulate an `if` block with function calls that modify global variables, then test how these modifications are handled and if proper returns occur based on those variables' states.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $update_global (param i32) (result i32)
      global.get $g
      local.get 0
      i32.add
      global.set $g
      global.get $g
    )
    (func $test_if (result i32)
      global.get $g
      if (result i32)
        (call $update_global (i32.const 1))
        (then (i32.const 10) (i32.const 20)) 
        (else (call $update_global (i32.const -1)) (i32.const 30))
      end
    )
  )
)