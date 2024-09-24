;; 10. Use a sequence where nested `br_if` instructions each terminating with `return`, placed within nested blocks. The test checks if these conditional branches followed by `return` commands correctly manage the operand stack and exit the function as expected.

(assert_invalid
  (module
    (func $nested_br_if_return (result i32)
      (i32.const 0)
      (block
        (block
          (block
            (br_if 0 (return (i32.const 10)))
          )
          (br_if 0 (return (i32.const 20)))
        )
        (br_if 0 (return (i32.const 30)))
      )
    )
  )
  "type mismatch"
)