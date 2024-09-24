;; 3. **Test 3**: Create nested `if` blocks with `br_if` instructions that branch to an outer label if a condition is met. Place an `unreachable` instruction within an inner `if` block path that should not be executed if the condition is correctly evaluated and the branch is taken.

(assert_invalid
  (module
    (func $nested_if_with_br_if
      (block $outer
        (if (i32.const 1)
          (then
            (if (i32.const 0)
              (then (unreachable))
              (else (br_if $outer (i32.const 1)))
            )
          )
        )
      )
    )
  )
  "invalid branch in br_if"
)