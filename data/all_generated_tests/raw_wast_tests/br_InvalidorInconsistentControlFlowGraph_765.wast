;; 6. **Invalid Target Outside Scope Test**: Arrange for a `br` instruction that attempts to target a label outside the valid scope of structured control instructions. This scenario ensures that the implementation detects and prevents branches to labels outside of the expected nesting hierarchy.

(assert_invalid
  (module
    (func $test
      (block $inner
        (block $outer
        )
        (br 1) ; Trying to branch to $outer which is outside the valid scope
      )
    )
  )
  "unknown label"
)