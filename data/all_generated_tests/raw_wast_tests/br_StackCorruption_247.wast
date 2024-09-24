;; 8. **Test Description**: Implement a combination of `block`, `loop`, and `if` instructions, ensuring that branches target labels with varying operand sizes. Test to see if the operand stack is correctly unwound and restored, thus checking for stack corruption.

(assert_invalid
  (module
    (func $complex-nested-branch
      (block $outer (result i32)
        (loop $inner
          (block $middle
            (br_if $inner (if (result i32)
              (i32.const 1) (i32.const 0)
              (then (br $middle))
              (else (br $outer))
            ))
          )
        )
        (i32.const 0) (br $outer)
      )
    )
  )
  "type mismatch"
)