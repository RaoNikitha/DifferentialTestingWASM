;; 10. Test incorrect type-coercion leading to an `unreachable` in either `then` or `else`:    ```    if (i32.const 1)       i32.const 0       call $func_that_expects_f32       unreachable     else       nop     end    ```    This checks if type mismatches in `if` branches are accurately detected to prevent wrongful execution leading to an `unreachable` instruction.

(assert_invalid
  (module
    (func $type-coercion-unreachable
      (if (result i32)
        (i32.const 1)
        (then 
          (i32.const 0)
          (call $func_that_expects_f32)
          (unreachable)
        )
        (else
          (nop)
        )
      )
    )
  )
  "type mismatch"
)