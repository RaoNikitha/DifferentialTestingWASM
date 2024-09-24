;; **Test 6**: Call a function that modifies global variables and relies on the stack to pass these variables. - **Constraint Checked**: Global variable type and state consistency. - **Stack Corruption Risk**: Incorrect stack handling for globals in wizard_engine may lead to unsynchronized global states and corrupted stack frames.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify-global
      (global.set $g (i32.const 10))
      (call $use-global)
    )
    (func $use-global 
      (drop (global.get $g))
    )
    (start $modify-global)
  )
  "type mismatch"
)