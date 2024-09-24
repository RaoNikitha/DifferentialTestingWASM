;; 6. Mo`re complex control, with nested `if` and `block` structures, and a `br_if` that checks an `i32` value from earlier in the nested blocks. The test verifies the correct interpretation of the condition and proper continuation or branching.

(assert_invalid
  (module
    (func $complex_control
      (block $outer
        (if (result i32)
          (then 
            (block $inner1
              (if (result i32)
                (then (block $inner2
                        (i32.const 1) (br_if 2)
                        (i32.const 0))))
              )
            (i32.const 1)
          )
          (else (i32.const 0))
        )
        (i32.const 0) (br_if 0) (i32.const 0)
      )
    )
  )
  "type mismatch"
)