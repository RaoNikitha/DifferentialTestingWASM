;; 2. **Test Description:** A loop structure that internally calls a function which itself contains a `br` instruction targeting the outer loop.    **Constraint Checked:** Confirm that `br` at the end of a function correctly resolves the loop label.    **Relation to Function Call/Return Handling:** Ensures that `br` unwinds properly post function call and loops back correctly without messing up return addresses.

(assert_invalid
  (module
    (func $innerFunc (param i32)
      (block $outer
        (block $inner 
          (br $outer)
        )
      )
    )
    (func
      (loop $outerLoop
        (call $innerFunc (i32.const 1))
      )
    )
  )
  "type mismatch"
)