;; 6. **Test Description 6:** Include an `unreachable` call in one of the branches of a `select` instruction nested inside a `block`, where the `block` expects the final type to be `i32`. The test is to see if either branch of select being unreachable prompts correct type enforcement.

(assert_invalid
  (module (func $type-block-select-unreachable-in-branch (result i32)
    (block (result i32)
      (select (unreachable) (i32.const 1) (i32.const 0))
    )
  ))
  "type mismatch"
)