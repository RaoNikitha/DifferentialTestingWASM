;; 3. **Test Description**: Design a scenario where a `br_if` in a deeply nested structure misinterprets a label in wizard_engine. Test with three nested `block` structures, placing the `br_if` in the innermost block with a label `2`, and ensure the branch resolves to the correct outermost block.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "invalid label"
)