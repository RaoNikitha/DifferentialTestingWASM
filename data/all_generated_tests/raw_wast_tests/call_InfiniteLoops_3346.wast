;; 5. **Test Description**:    Construct a function with a `loop` that incorporates a `call` to another function modifying a global variable. Use `br_if` conditions based on the global. Verify if improper global access leads to infinite iterations.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
    )
    (func $loop_call
      (loop $label
        (call $modify_global)
        (br_if $label (i32.lt_s (global.get $g) (i32.const 10)))
      )
    )
  )
  "global access in loop"
)