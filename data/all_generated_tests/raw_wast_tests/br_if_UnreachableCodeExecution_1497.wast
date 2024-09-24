;; 8. **Test 8**: Set up an `if` construct within a `block`, where the `br_if` is used to conditionally branch from the `if` to an `unreachable` instruction in the enclosing `block`. Ensure that the `if` condition is false and the stack transformation is managed correctly, preventing `unreachable` if conditions are right.

(assert_invalid
  (module
    (func $block_with_if
      (block
        (if (result i32)
          (then
            (br_if 0 (i32.const 0))
            unreachable
          )
        )
      )
    )
  )
  "type mismatch"
)