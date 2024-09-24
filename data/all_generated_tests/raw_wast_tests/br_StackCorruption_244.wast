;; 5. **Test Description**: Write a WebAssembly module with multiple `if` conditions containing different arithmetic operations and use `br` to exit from within the conditions. Verify if both engines maintain consistent operand stack during these branches.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (i32.const 5)
          (br 0)
        )
        (else
          (i32.const 3)
          (br 0)
        )
      )
      (i32.add)
    )
  )
  "type mismatch"
)