;; 3. **Test Description:** Implement a `loop` construct containing a `call` to a function with local variables and a `br` instruction targeting the start of the `loop`. Assess if the `loop` continues correctly and if the function's local frame is appropriately handled.

(assert_invalid
  (module
    (func $loop_with_call
      (loop
        (call $dummy_function)
        (br 0)
      )
    )
    (func $dummy_function
      (local $var1 i32)
      (local.set $var1 (i32.const 1))
    )
  )
  "local frame not handled correctly"
)