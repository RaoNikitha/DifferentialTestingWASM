;; Create an `if` block using non-standard block types, ensuring that mismatching input types identify validation errors without erroneously reaching an `unreachable` statement.

(assert_invalid
  (module 
    (func $type-mismatch-if-block (result i32)
      (if (result i32 i32) (i32.const 1)
        (then
          (i32.const 4)
          (i32.const 5)
        )
        (else
          (i32.const 6)
          (i32.const 7)
        )
      )
    )
  )
  "type mismatch"
)