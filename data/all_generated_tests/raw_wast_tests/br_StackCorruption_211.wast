;; 2. Nest two `blocks` and use `br` to exit the outer block from inside the inner block. Verify if the stack unwinds correctly and operands are restored. This checks for stack underflows/overflows due to incorrect nested block handling.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block
          (br 1 (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)