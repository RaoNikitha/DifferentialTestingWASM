;; 4. **Test Case 4**:    - **Description**: Develop a module with an invalid table index for `call_indirect` that falls out of the bounds, followed by an instinctive `br` instruction targeting this invalid index. The table should trap properly while the `br` instruction should reference an outer scope correctly.    - **Constraint Checked**: Validations of out-of-bounds access and proper trap handling.    - **Incorrect Branch Target Resolution**: Assures that `br` targets an outer scope instead of trapping or misjudging target depth.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $test-func-1 (param i32))
    (table 1 funcref)
    (elem (i32.const 0) $test-func-1)
    (func $type-out-of-bounds (result i32)
      (call_indirect (type 0) (i32.const 2))
      (br 1)
    )
  )
  "element index out of bounds"
)