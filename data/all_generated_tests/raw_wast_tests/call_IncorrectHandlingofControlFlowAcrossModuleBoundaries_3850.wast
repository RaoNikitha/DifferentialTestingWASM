;; 9. Implement an exported function in one module that modifies global state and import it in another module. Call this function repeatedly from the importing module and check for correct handling of global state changes across the modules, ensuring that any function index errors are correctly reported.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $update-global (global.set $g (i32.add (global.get $g) (i32.const 1))))
    (export "update" (func $update-global))
  )
)

(assert_invalid
  (module
    (import "env" "update" (func $update (result i32)))
    (func $test
      (call $update)
      (call $update)
      (call $update)
      (if (i32.ne (global.get $g) (i32.const 3)) (then (unreachable)))
    )
  )
  "type mismatch"
)