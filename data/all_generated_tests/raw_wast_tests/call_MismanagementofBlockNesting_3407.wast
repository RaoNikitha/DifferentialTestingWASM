;; 6. **Function Call Mid-Block Depth Change**: Have a test where `br_table` instructions change block depths immediately before and after `call` instructions. The goal is to ensure the appropriate block depth is maintained after the function call and that control flow does not misinterpret the change.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (br_table $inner $outer (i32.const 0))
          (call 1)
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)