;; - Test 9: Develop a test where a block performs a `call` to a function that internally causes a `trap` due to type mismatch, checking if the outer block properly captures and handles the trap scenario.

(assert_invalid
  (module
    (func $type-mismatch-callee
      (unreachable) ; This function causes a trap
    )
    (func $type-mismatch-in-block
      (block (result i32)
        (call $type-mismatch-callee) ; Calls the function causing a trap
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)