;; Construct a module where a function accesses a global variable immediately after a `call` instruction. Modify the global variable before the call and check if access to the global variable afterwards returns consistent results across implementations.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 42))
    (func $set-global
      (global.set $g (i32.const 100))
      (call $access-global)
    )
    (func $access-global (result i32)
      (global.get $g)
    )
    (start $set-global)
  )
  "type mismatch"
)