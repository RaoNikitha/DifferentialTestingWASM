;; 6. **Test Description 6**:    - **Scenario**: Insert multiple sequential `nop` instructions before a `call` instruction in a deeply nested function.    - **Constraint Check**: Validate that multiple `nop`s do not interfere with nested function calls and returns.    - **Relation to Improper Handling**: Ensures robustness of the function call stack handling with redundant `nop`s.

(assert_invalid
  (module
    (func $nested
      (block
        (loop
          (if (i32.const 1)
            (then
              (nop) (nop) (nop) (call $helper)
            )
            (else
              (nop) (nop) (nop) (call $helper)
            )
          )
        )
      )
    )
    (func $helper)
  )
  "invalid function type"
)