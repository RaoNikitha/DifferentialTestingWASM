;; 1. **Test Description:** Create a nested loop structure with a `block` inside. Use a `br_if` to conditionally branch out of the innermost loop, ensuring the stack state is preserved correctly. Place an `unreachable` instruction right after the `br_if` to check if the branch logic leads to an unexpected termination.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (loop $inner
          (block $exit
            (i32.const 1) (br_if $exit) (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)