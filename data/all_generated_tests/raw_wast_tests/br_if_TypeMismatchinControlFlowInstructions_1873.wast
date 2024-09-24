;; 4. **Test 4**:    - **Description**: A label referencing an outer `block` expecting `i64`, with an inner block expecting `i32`. A `br_if` is used to conditionally jump to the outer `block`.    - **Constraint**: Checks if the `br_if` can correctly match the outer block's result type, considering the inner block stack.    - **Relation to Type Mismatch**: Evaluates the handling of type stacks when crossing different scoped block structures.

(assert_invalid
  (module
    (func $type-outer-vs-inner (result i64)
      (block (result i64)
        (block (result i32)
          (drop (br_if 1 (i32.const 1)) (i32.const 2))
        )
        (i64.const 3)
      )
    )
  )
  "type mismatch"
)