;; 8. Develop a scenario with nested blocks where a deep branch index is miscalculated, leading to an erroneous break to an outer unreachable instruction, testing deep label manipulation.

(assert_invalid
  (module (func $deep-branch-index-miscalculation
    (block (result i32)
      (block
        (block
          (block
            (block
              (block
                (br 5 (i32.const 1))
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)