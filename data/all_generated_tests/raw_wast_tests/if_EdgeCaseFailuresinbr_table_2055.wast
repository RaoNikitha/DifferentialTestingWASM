;; 6. **Default Case in `br_table` with Unspecified Default**:    - Generate a test where the `if` block contains a `br_table` that omits an explicit default case, relying on the last target as default. The focus is on identifying how uninitialized states in OCaml versus explicit reset in the wizard engine influence the handling of the fallback target.

(assert_invalid
  (module
    (func $unnamed (result i32)
      (local i32)
      (if (result i32)
        (i32.const 1)
        (then
          (block $label0
            (br_table $label0 (local.get 0))
          )
        )
        (else
          (i32.const 2)
        )
        (end)
      )
    )
  )
  "type mismatch"
)