;; 7. **Test 7:** An `unreachable` instruction is placed right after an invalid operation expecting the function's error handling to trap without executing any further instruction. ```wat (function (param i32) (result i32)   (i32.div_u (local.get 0) (i32.const 0)) ;; would cause division by zero   unreachable ) ```

(assert_invalid
  (module
    (func (param i32) (result i32)
      (i32.div_u (local.get 0) (i32.const 0))
      (unreachable)
    )
  )
  "division by zero"
)