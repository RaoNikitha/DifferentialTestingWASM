;; 8. **Test 8**: Write a function that uses multiple local variable manipulations before a `return`, checking if those manipulations are correctly disregarded or maintained, based on proper CFG termination.

(assert_invalid
  (module
    (func $multiple-local-manipulations (result i32)
      (local i32) (local i32)
      (i32.const 10) (local.set 0)
      (i32.const 20) (local.set 1)
      (return)
      (local.get 0)
      (i32.add (local.get 1))
    )
  )
  "type mismatch"
)