;; 5. **Test 5**:    - Construct a scenario where a function indirectly called via `call_indirect` includes a loop. The instruction should utilize an out-of-bounds table index causing a trap without an infinite loop.    - **Constraint Checked**: Tests error handling for invalid table indexing to prevent infinite loops due to out-of-bounds errors.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $indirect-loop
      (loop
        (call_indirect (type 0) (i32.const 2)))
    )
  )
  "undefined element"
)