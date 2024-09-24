;; 10. **Nested Breaks with Multiple Calls**: Design a scenario featuring `loop` structures with numerous `br` and `br_table` instructions interspersed with `call` instructions. The test checks whether the function calls return appropriately and the `br` operations influence the correct block depths without mismanaging the flow.

(assert_invalid
  (module
    (func $nested-breaks-with-multiple-calls
      (loop
        (call 1)
        (i32.const 0)
        (br_table 0 0)
        (call 2)
        (br 0)
      )
    )
    (func (param i32))
    (func (param f64))
  )
  "type mismatch"
)