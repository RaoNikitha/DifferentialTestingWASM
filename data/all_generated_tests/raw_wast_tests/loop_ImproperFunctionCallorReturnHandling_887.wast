;; Generate a loop with one `br_if` instruction conditionally branching based on a return value from a nested `call`, and test for differences in how branch conditions incorporating return values are managed.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $test
      (i32.const 0)
      (loop (result i32)
        (call $some_func)
        (br_if 0)
      )
    )
    (func $some_func (result i32) (i32.const 1))
  )
  "type mismatch"
)