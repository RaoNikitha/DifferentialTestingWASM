;; 8. **Test Immediate Block with Outward `br`**:    - An immediate block containing a `br` intended to jump to a parent block beyond its immediate parent’s scope.    - This checks if outward branches respect block scoping rules.    - Expected result: WebAssembly should error out, wizard_engine may exhibit unexpected jumps or failures.

(assert_invalid
  (module
    (func $test-label-scoping
      (block
        (block
          (br 1)
        )
      )
    )
  )
  "branch out of scope"
)