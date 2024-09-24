;; 3. **Test 3**: Design a WASM function with a nested `if` block inside a `loop`, followed by a `br_table` instruction that includes indices jumping both inside and outside the nested `if` and `loop`. This tests if the implementation can manage outward branches correctly and respects the label lookups relative to the nesting depth.

(assert_invalid
  (module
    (func
      (block
        (loop
          (i32.const 0)
          (if (result i32)
            (then
              (br_table 1 0 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)