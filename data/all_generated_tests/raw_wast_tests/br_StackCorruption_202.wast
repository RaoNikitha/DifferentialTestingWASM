;; 3. Test Description: Design a WebAssembly function with intermixed calls and `br` instructions targeting nested blocks. Ensure the operand stack heights vary across transitions. Verify that no stack underflows or corruptions occur due to improper `popAny` logic in `wizard_engine`.

(assert_invalid
  (module
    (func
      (block
        (i32.const 42)
        (block
          (br 1)
          (i32.const 24)
        )
        (i32.const 1)
      )
      (br 0)
    )
  )
  "stack underflow"
)