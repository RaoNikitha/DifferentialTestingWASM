;; 2. **Test Description 2**: Create a nested `if-else` structure within a `block`, consuming and producing different types of values. Use `br_if` to exit early from various levels of the nested structure. Validate proper stack handling and ensure that the subsequent instructions operate on the correct stack state by checking if `wizard_engine` correctly interprets label results and params.

(assert_invalid
  (module
    (func $nested-if-else-block
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (br_if 0 (i32.const 1))
            (i32.const 42)
          )
          (else
            (br_if 0 (i32.const 0))
            (i32.const 99)
          )
        )
      )
    )
  )
  "type mismatch"
)