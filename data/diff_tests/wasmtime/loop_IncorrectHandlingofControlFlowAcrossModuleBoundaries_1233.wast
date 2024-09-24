;; 4. **Test Case 4**: Use a loop to call an imported function that involves manipulations with global variables (imported/global). Check if both implementations handle the update and access of these globals correctly, especially ensuring accurate control flow across module boundaries.

(assert_invalid
  (module
    (import "env" "foo" (func $foo (param i32) (result i32)))
    (global $g (mut i32) (i32.const 0))
    (func (result i32)
      (loop (result i32)
        (call $foo (global.get $g))
        (global.set $g (i32.const 1))
        (br 0)
      )
    )
  )
  "type mismatch"
)