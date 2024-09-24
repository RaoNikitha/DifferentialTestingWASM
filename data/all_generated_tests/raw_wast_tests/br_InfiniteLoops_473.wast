;; 4. **Test Description**: Integrate multiple looping structures where inner loops utilize `br` instructions to jump to an outer loop conditionally. Includes a final `br_if` that should break the outermost loop on a conditional check.    **Constraint**: Verifies correct handling of forward and backward branches.    **Relation to Infinite Loops**: Incorrect relative label handling might result in erroneous jumps causing inner loops to never break as intended.

(assert_invalid
  (module
    (func (local i32)
      (loop (result i32)
        (block (result i32)
          (br_if 1 (i32.eq (local.get 0) (i32.const 0))) 
          (loop (result i32)
            (br 2 (i32.eq (local.get 0) (i32.const 1)))
            (br 1 (i32.eq (local.get 0) (i32.const 2)))
          )
        )
      )
    )
  )
  "type mismatch"
)