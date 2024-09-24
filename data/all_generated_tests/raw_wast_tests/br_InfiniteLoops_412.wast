;; 3. **Test Description 3:**    - Use a `loop` with multiple nested `block` structures, where the innermost block uses `br` to exit the loop but misinterprets the relative label indexing, causing the loop to repeat indefinitely.    - **Constraint: Relative Label Lookup**    - **Relation to Infinite Loop:** Misinterpreted label lookup causes the `br` to miss the intended exit point.

(assert_invalid
  (module
    (func $infinite-loop
      (loop (block (block (i32.const 0) (br 2))))
    )
  )
  "unknown label"
)