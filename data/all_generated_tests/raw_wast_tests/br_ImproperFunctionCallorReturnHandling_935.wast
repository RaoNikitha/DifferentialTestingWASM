;; <Test 6> Formulate a WebAssembly function with a complex control flow, including a `block` with a nested `loop` and `if` construct. Put a `call_indirect` within the loop and after it, use `br` to target the outer block. Test if the indirect function call completes correctly and the function call context is properly restored after the branch.

(assert_invalid
  (module
    (table anyfunc (elem))
    (type $sig (func))
    (func $test
      (block $outer
        (loop
          (if (i32.const 1)
            (then
              (call_indirect $sig (i32.const 0))
              (br $outer)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)