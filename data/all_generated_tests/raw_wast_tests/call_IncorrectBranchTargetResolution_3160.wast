;; Test 9: Develop a deeply nested function with interlaced `block` statements and `br` instructions, making use of intermediary function calls. Pass parameters that stress test label resolution within nested branches, highlighting possible adoption of incorrect resolution behavior.

(assert_invalid
  (module
    (func $deep-nested (param i32 i32)
      (local i32 i32)
      (block
        (block
          (call 1 (i32.const 10))
          (br 1)
        )
        (block
          (block
            (call 2 (get_local 0) (get_local 1))
            (br 1)
          )
          (call 3 (get_local 2) (get_local 3))
          (br 0)
        )
      )
    )
    (func (param i32) (result i32) (i32.const 1))
    (func (param i32 i32) (result i32) (i32.const 2))
    (func (param i32 i32) (result i32) (i32.const 3))
  )
  "type mismatch"
)