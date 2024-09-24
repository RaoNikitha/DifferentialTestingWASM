;; 10. **Test Description 10**: Design a control structure with a `br_if` targeting a parent `block` that includes a call to a function returning a compound value. Push additional arguments post function-call before `br_if`. Test stack integrity and correct alignment, highlighting any stack corruption where differences might arise in handling function results.

(assert_invalid
  (module
    (func $test
      (result i32)
      (block (result i32)
        (call $compound_fn) (i32.const 1) (br_if 0 (i32.const 1)) (i32.const 0)
      )
    )
    (func $compound_fn (result i32 i32)
      (i32.const 10) (i32.const 20)
    )
  )
  "type mismatch"
)