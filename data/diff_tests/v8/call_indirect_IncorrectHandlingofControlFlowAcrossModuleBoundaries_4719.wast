;; Create cyclic imports where module A imports a function from module B, and module B imports a function from module A. Perform indirect calls in both directions, ensuring that stack state and control flow are preserved correctly.

(assert_invalid
  (module
    (import "B" "func_b" (func $func_b (param i32) (result i32)))
    (func (export "func_a") (param i32) (result i32)
      (call_indirect (type 0) (local.get 0))
    )
    (table 1 funcref)
    (elem (i32.const 0) $func_b)
    (type (func (param i32) (result i32)))
  )
  "invalid import"
)
(assert_invalid
  (module
    (import "A" "func_a" (func $func_a (param i32) (result i32)))
    (func (export "func_b") (param i32) (result i32)
      (call_indirect (type 0) (local.get 0))
    )
    (table 1 funcref)
    (elem (i32.const 0) $func_a)
    (type (func (param i32) (result i32)))
  )
  "invalid import"
)