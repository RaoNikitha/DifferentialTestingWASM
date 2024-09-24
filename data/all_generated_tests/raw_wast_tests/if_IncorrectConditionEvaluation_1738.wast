;; 9. **Nested `br_if` Conditions**: Construct a test involving nested `br_if` instructions with varied conditions. Ensure that each `br_if` is correctly influenced by its respective condition. Verify if an implementation misinterprets nested conditions causing incorrect branches to be taken or ignored.

(assert_invalid
  (module
    (func $nested_br_if_conditions (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
          (br_if 0 (i32.const 0))
        )
        (else
          (i32.const 3)
          (if (result i32)
            (then
              (i32.const 4)
              (br_if 0 (i32.const 1))
            )
            (else
              (i32.const 5)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)