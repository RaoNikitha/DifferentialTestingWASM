;; 6. **Test Description 6:** Create a function within the module that imports another function with a control flow involving `br` instructions targeting various label indices. Check for proper execution and control flow adherence after the imported function's internal `br` jumps.

(assert_invalid
  (module
    (import "env" "external_fn" (func $external_fn (result i32)))
    (func (result i32)
      (block (result i32)
        (br 0 (call $external_fn))
      )
    )
  )
  "type mismatch"
)