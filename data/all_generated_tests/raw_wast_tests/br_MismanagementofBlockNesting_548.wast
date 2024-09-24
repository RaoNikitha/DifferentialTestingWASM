;; 9. **Function Encapsulation with Nested Control Structures:**    Encapsulate multiple nested blocks and loops within a function, with `br` instructions targeting different depths within these encapsulated structures. Validate the correct handling of function boundaries when branching.

(assert_invalid
  (module
    (func $nested-control-structs
      (block
        (loop
          (block
            (br 2)
            (loop
              (br 1)
            )
          )
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)