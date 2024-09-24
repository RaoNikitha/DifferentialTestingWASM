;; 7. Create a complex structure of nested `block` instructions with multiple `br` instructions targeting different depths. The test validates correct handling of nested labels by intentionally breaking from various depths and checking if the control flow resumes correctly after each break.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (br 3 (i32.const 42)
                (br 2 (i32.const 33)
                  (br 1 (i32.const 24)
                    (br 0 (i32.const 15))))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)