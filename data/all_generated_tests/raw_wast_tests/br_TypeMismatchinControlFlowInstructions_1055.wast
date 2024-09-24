;; 6. **Test 6: Incorrect Stack Polymorphism Handling in Nested Control Instructions**    - Design a nested `block` test case where an inner block ends with a mismatched type `br`, misaligning the expected `[t*]` in context.    - Ensures adherence to stack polymorphism rules when dealing with nested control instructions.    - Tests proper stack height and type handling during unwind operations.

(assert_invalid
  (module
    (func $nested-block-mismatch-type
      (block
        (block
          (i32.const 1)
          (br 1)
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)