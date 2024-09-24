;; 10. **Test Description 10:**     - A scenario with a loop checkpoint controlled via `br` that fails to correctly calculate relative indexing in the presence of nested blocks, causing repeated loop iterations.     - **Constraint: Correct Branch Behavior**     - **Relation to Infinite Loop:** Miscomputed branch labels force endless looping.

(assert_invalid
  (module
    (func $loop-checkpoint
      (loop $outer
        (block $inner
          (br $inner) 
          (loop $nested
            (if (i32.eqz (i32.const 1))
              (br $outer)
            )
          )
        )
      )
    )
  )
  "unknown label"
)