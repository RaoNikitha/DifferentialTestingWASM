;; 7. **Test Description:** Design a module where a function exported to another module includes `br` instructions within nested `if-else` blocks. Verify if branching within these nested blocks in the imported function is correctly handled.    - **Constraint:** Ensures correct branching behavior within nested `if-else` blocks in exported functions.    - **Relation:** Tests structured control enforcement rules when branching within nested blocks across modules.

(assert_invalid
  (module
    (func $exported_fn (result i32)
      (if (i32.const 1)
        (then 
          (if (i32.const 1)
            (then (br 1))
            (else (br 0))
          )
        )
        (else
          (br 0)
        )
      )
    )
    (export "exported_fn" (func $exported_fn))
  )
  "type mismatch"
)