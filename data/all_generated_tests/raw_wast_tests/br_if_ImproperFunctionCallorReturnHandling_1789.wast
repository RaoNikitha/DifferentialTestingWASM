;; 10. **Test 10: False Condition with Stack Polymorphism**: Introduce false conditions in `br_if` following a function call having different potential stack states. This scenario tests stack polymorphism handling consistency between `WASM` and `wizard_engine`, focusing on proper instruction type enforcement post condition check.

(assert_invalid
  (module
    (func $false-cond-stack-polymorphism
      (block
        (call $dummy) (i32.const 0)
        (br_if 1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)