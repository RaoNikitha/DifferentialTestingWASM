;; 10. **Test Description 10:** Use a scenario where an exported function from another module calls into the main module and then relies on a `br` to navigate back to the outer block or loop context of the exporting module. Ensure stack consistency and correct boundary transitions for control flow.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $internal
      (block
        (call $externalFunc)
        (br 0)
      )
      (i32.const 0)
      (drop)
    )
  )
  "type mismatch"
)