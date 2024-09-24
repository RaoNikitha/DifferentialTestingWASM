;; 7. **Test with Conditional Branching to Outer Block:** Within a nested conditional structure, place `unreachable` in a way that a `br_if` statement jumps to an outer block based on condition evaluation. Validate correct behavior by checking that a trap occurs on hitting `unreachable`.

(assert_invalid
  (module (func $type-nested-conditional-unreachable
    (block $outer
      (block $inner
        (br_if $outer
          (i32.const 0)
        )
        (unreachable)
      )
    )
  ))
  "type mismatch"
)