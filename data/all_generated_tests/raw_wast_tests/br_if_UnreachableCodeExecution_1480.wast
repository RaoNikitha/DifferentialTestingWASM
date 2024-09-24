;; 1. **Test 1**: Create a nested structure with multiple `block` instructions. Add `br_if` instructions that branch to a deeply nested label index. Include an `unreachable` instruction that should not be executed if the label is correctly resolved. Verify if the `unreachable` is reached due to incorrect label indexing.

(assert_invalid
  (module
    (func $nested-labels
      (block
        (block
          (block
            (br_if 2 (i32.const 1))
            unreachable
          )
        )
      )
    )
  )
  "type mismatch"
)