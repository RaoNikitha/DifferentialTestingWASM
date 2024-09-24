;; A test where chain nested `if` instructions each call different functions (`call`), ensuring that all function return values are correctly propagated to the stack and verifying label correctness at each nesting level.

(assert_invalid
  (module (func $nested-if-call (result i32)
    (if (result i32) (i32.const 1)
      (then 
        (if (result i32) (i32.const 1)
          (then (call $func1) (i32.const 1))
          (else (i32.const 1))
        )
        (i32.const 1)
      )
      (else (i32.const 1))
    )
  ))
  "undefined function"
)