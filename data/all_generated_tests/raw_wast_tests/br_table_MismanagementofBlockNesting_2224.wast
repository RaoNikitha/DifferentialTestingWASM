;; 4. Create a test with a combination of nested blocks and conditional statements (`if-else`) where `br_table` is used inside the `else` branch. This checks if the implementation accurately manages control flow in conditional branches.

(assert_invalid
  (module
    (func $nested_if_else_br_table
      (block $L1
        (block $L2
          (if (result i32)
            (i32.const 1)
            (then
              (i32.const 0)
            )
            (else
              (br_table 0 1 1 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)