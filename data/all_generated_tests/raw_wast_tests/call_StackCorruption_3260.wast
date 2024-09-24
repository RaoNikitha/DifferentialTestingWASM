;; **Test 9**: Use a `call` instruction within a loop structure. - **Constraint Checked**: Correct loop and call stack frame management. - **Stack Corruption Risk**: If wizard_engine mishandles loop iterations involving calls, this could lead to stack overflow when loops are improperly unrolled.

(assert_invalid
  (module
    (func $test_loop (result i32)
      (local $i i32)
      (loop (result i32)
        (local.set $i (i32.const 100))
        (call $recursive_function)
        (local.get $i)
        (i32.eqz)
        (br_if 0)
      )
    )
    (func $recursive_function (result i32)
      (i32.const 42)
    )
    (func (export "run") (result i32)
      (call $test_loop)
    )
  )
  "function call in loop"
)