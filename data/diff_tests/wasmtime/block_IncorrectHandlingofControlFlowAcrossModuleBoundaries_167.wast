;; 8. Implement a `block` that calls an imported function, which in turn exports another function containing a nested `block`. Test if the return correctly resumes from the initial `block` in the original module.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func (export "exported_func") (result i64)
      (block (result i64)
        (call $imported_func)
        (block (result i64)
          (i64.const 42)
        )
      )
    )
  )
  "type mismatch"
)