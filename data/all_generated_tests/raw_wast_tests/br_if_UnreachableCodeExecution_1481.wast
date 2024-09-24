;; 2. **Test 2**: Formulate a loop structure containing a `br_if` that attempts to branch backward out of the loop, targeting an outer block label. Include an `unreachable` instruction at the end of the outer block to check if incorrect backward branching leads to its execution.

(assert_invalid
  (module
    (func $backward-br_if
      (block $outer
        (loop $inner
          (br_if $outer (i32.const 1)) ;; Illegal backward branch to outer block
          (br $inner)
        )
      )
      (unreachable) ;; This should not be executed if br_if improperly branches backward
    )
  )
  "invalid branch"
)