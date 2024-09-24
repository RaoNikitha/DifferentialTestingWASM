;; 4. **Test Description**: Set up a `block` containing a `br_if` instruction directing control to an import, where the target's stack frame results in a type error.    **Constraint**: Validate error handling of conditional branches across module boundaries.

(assert_invalid
  (module
    (import "env" "target" (func $target))
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 0 (call $target))
      )
    )
  )
  "type mismatch"
)