;; 9. Use a function that contains `br_table` branching to another function with an empty parameter and return type. Test with an out-of-range `br_table` index to see if the incorrect signature and parameter popping in wizard_engine lead to inconsistent stack states compared to WebAssembly.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32) (result i32)))
    (func $target
      (block $label
        (br_table $label (i32.const 0))
      )
    )
    (func (call $target) (call $target))
  )
  "type mismatch"
)